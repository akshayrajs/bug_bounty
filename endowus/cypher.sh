#!/bin/bash

# Colors for aesthetics
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

domain="$1"
github_token="$2"

if [[ -z "$domain" ]]; then
    echo -e "${YELLOW}[ERROR] Usage: $0 <domain.com> <github_token>${RESET}"
    exit 1
fi

if [[ -z "$github_token" ]]; then
    read -s -p "Enter your GitHub token: " github_token
    echo
fi

required_tools=(subfinder assetfinder findomain github-subdomains curl jq)
for prog in "${required_tools[@]}"; do
    if ! command -v "$prog" &>/dev/null; then
        echo -e "${YELLOW}[ERROR] Required tool '$prog' is not installed.${RESET}"
        exit 2
    fi
done

declare -A outfiles=(
    [subfinder]="subfinder.txt"
    [assetfinder]="assetfinder.txt"
    [findomain]="findomain.txt"
    [crt]="crt.txt"
    [wayback]="wayback.txt"
    [github]="${domain}.txt"
)

# Clean old files
for file in "${outfiles[@]}"; do
    [[ -f $file ]] && rm -f "$file"
done

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    local temp
    echo -ne " "
    while kill -0 "$pid" 2>/dev/null; do
        temp="${spinstr#?}"
        printf " [%c]  \r" "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
    done
    echo -ne "     \r"
}

run_tool() {
    local name="$1"
    local cmd="$2"
    local outfile="${outfiles[$name]}"

    echo -e "${CYAN}[STARTED]${RESET} $name ..."
    # Run command in background
    bash -c "$cmd" > "$outfile" 2>&1 &
    local pid=$!
    echo -ne "${YELLOW}[RUNNING]${RESET} $name "
    spinner $pid
    wait $pid
    echo -e "${GREEN}[COMPLETED]${RESET} $name, output saved to $outfile"
}

run_tool subfinder "subfinder -d $domain -all -recursive | grep $domain"
run_tool assetfinder "assetfinder $domain --subs-only"
run_tool findomain "findomain -t $domain | grep '.$domain'"
run_tool crt "curl -sk 'https://crt.sh?q=%25.$domain&output=json' | jq -r '.[].name_value'"
run_tool wayback "curl -sk 'http://web.archive.org/cdx/search/cdx?url=*.$domain/*&output=text&fl=original&collapse=urlkey' | sort | sed -e 's_https*://__' -e 's/\/.*//' -e 's/:.*//' -e 's/^www\.//' | sort -u"
run_tool github "github-subdomains -d $domain -t $github_token"

# Aggregate all results
cat "${outfiles[subfinder]}" "${outfiles[assetfinder]}" "${outfiles[findomain]}" "${outfiles[crt]}" \
    "${outfiles[wayback]}" "${outfiles[github]}" | grep "\.$domain" | sort -u > domain.txt

total_domains=$(wc -l < domain.txt)

echo -e "${GREEN}[ALL COMPLETED]${RESET} Total unique domains found: ${total_domains}"
echo -e "${CYAN}Aggregated results saved to domain.txt${RESET}"


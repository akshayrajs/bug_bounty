#!/bin/bash

# ────────────────────────────────────────────
# Colors
# ────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

domain="$1"

declare -A outfiles=(
    [subfinder]="subfinder.txt"
    [assetfinder]="assetfinder.txt"
    [findomain]="findomain.txt"
    [crt]="crt.txt"
    [wayback]="wayback.txt"
    [github]="${domain}.txt"
    [virustotal]="virustotal.txt"
)

cat "${outfiles[@]}" \
    | sed -E 's/^\*\.\s*//' \
    | grep -Ei '^((xn--[A-Za-z0-9-]{1,59})|([A-Za-z0-9]([A-Za-z0-9-]{0,61}[A-Za-z0-9])?))(\.((xn--[A-Za-z0-9-]{1,59})|([A-Za-z0-9]([A-Za-z0-9-]{0,61}[A-Za-z0-9])?)))*\.'"${domain}"'$' \
    | sort -u > domain.txt \

echo "${domain}" >> domain.txt

# ────────────────────────────────────────────
# Done
# ────────────────────────────────────────────
total=$(wc -l < domain.txt)
echo -e "${GREEN}[ALL COMPLETED]${RESET} Total unique domains found: $total"
echo -e "${CYAN}Saved to: domain.txt${RESET}"


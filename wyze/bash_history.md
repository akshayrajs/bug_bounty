# Recon
### Subfinder

```
subfinder -d wyze.com -all -recursive | grep 'wyze.com' > subfinder.txt
```

### Assetfinder

```
assetfinder wyze.com --subs-only > assetfinder.txt
```

### Amass

```
amass enum -passive -d wyze.com | cut -d']' -f 2 | awk '{print $1}' | sort -u > amass.txt
```

### Finddomain

```
findomain -t target.com | tee findomain.txt
```

### Github-subdomains

```
github-subdomains -d wyze.com -t <github-token>
```

### Web-Scraping

```
curl -s https://crt.sh\?q\=\wyze.com\&output\=json | jq -r '.[].name_value' > crt.txt
curl -s "http://web.archive.org/cdx/search/cdx?url=*.wyze.com/*&output=text&fl=original&collapse=urlkey" |sort| sed -e 's_https*://__' -e "s/\/.*//" -e 's/:.*//' -e 's/^www\.//' | sort -u > wayback.txt
```

### Removing Duplicated

```
cat *.txt | sort -u | anew > domain.txt
```

### Active Domains

```
cat domain.txt | httpx-toolkit -ports 80,443,8080,8000,8888 -threads 200 > alive_domains.txt
```

# Endpoint Discovery

### Active Discovery

```
katana -u alive_domains.txt -d 3 -o url1.txt
cat url1.txt | hakrawler -u > url2.txt
```

### Passive Discovery

```
urlfinder -d wyze.com | sort -u url3.txt
```
### Remove Duplicated and Combining

```
cat url* | anew | sort -u > allurl.txt
```

### Param and Content Discovery

```
cat allurl.txt | grep "=" 
cat allurl.txt | grep -E "\.(xls|xml|xlsx|json|pdf|sql|doc|docx|pptx|txt|zip|tar\.gz|tgz|bak|7z|rar|log|cache|secret|db|backup|yml|gz|config|csv|yaml|md|md5|tar|xz|7zip|p12|pem|key|crt|csr|sh|pl|py|java|class|jar|war|ear|sqlitedb|sqlite3|dbf|db3|accdb|mdb|sqlcipher|gitignore|env|ini|conf|properties|plist|cfg)$"
arjun -u https://wyze.com/ -oT arjun_output.txt -t 10 --rate-limit 10 --passive -m GET,POST --headers "User-Agent: Mozilla/5.0"
```
### Sensitive File

```
echo alive_domain.txt | katana -d 3 | grep -E "\.js$" | nuclei -t ~/.local/nuclei-templates/http/exposures/ -c 30
```

### Network Scans

```
rustscan -a alive_domain.txt --range 1-65535 --ulimit 3500 
```

Place the output in a file

```
awk '{split($2,a,":"); ip=a[1]; port=a[2]; ports[ip] = ports[ip] ? ports[ip] "," port : port} \n     END {for (i in ports) print i " | " ports[i]}' scan.txt > better_scan.txt
```

This will help better visualize the ports with ip.

## Web exploits

```
echo alive_domain.txt | katana -d 3 | nuclei -t xss,ssrf,ssti,rce,sqli -c 30
subzy run --targets domains.txt --concurrency 100 --hide_fails --verify_ssl
```

# futhur to be added web discovery not completed on my end sedly

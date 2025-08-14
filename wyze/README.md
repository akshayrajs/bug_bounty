## Report

---

### Methodology  

1. **Subdomain Enumeration**  
   Tools used: `amass`, `subfinder`, `assetfinder`, `findomain`, and scraping from `crt.sh`, `Wayback Machine`, and `VirusTotal`.

2. **IP Resolution**  
   Tool used: `dig`  
   - All alive subdomains were resolved to their corresponding IP addresses and cname.

4. **Port Scanning**  
   Tool used: `rustscan`  
   - Scope: All ports
   - Output format: `Domain | IP`  
   - All scans were performed without sending exploit payloads to avoid service disruption.

---

### Domain with IP 

```sh
wyze.com | 23.227.38.33  
auth-beta.api.wyze.com | 18.161.246.85  
supplychain.wyze.com | 52.37.210.254  
pipeline.wyze.com | 44.229.174.89  
beta-oauth.api.wyze.com | 54.186.10.165  
why.wyze.com | 104.18.16.124  
hms.api.wyze.com | 18.161.229.88  
iap.api.wyze.com | 18.161.229.126  
bi.wyze.com | 44.228.7.93  
middleware.auth.wyze.com | 52.40.29.38  
ablink.noreply.wyze.com | 104.18.17.124  
o3.ptr7523.wyze.com | 159.183.108.103  
configservice.api.wyze.com | 18.161.246.11  
hms.wyze.com | 18.67.161.88  
ablink.hello.wyze.com | 104.18.16.124  
o2747.abmail.noreply.wyze.com | 149.72.70.198  
auth.wyze.com | 54.148.55.125  
o2745.abmail.hello.wyze.com | 149.72.152.90  
o2.ptr5944.wyze.com | 159.183.9.92  
ablink.shop.wyze.com | 104.18.17.124  
hms-beta.api.wyze.com | 18.161.246.9  
services.wyze.com | 50.112.179.111  
i.wyze.com | 34.120.251.165  
auth-prod.api.wyze.com | 18.161.246.37  
go.wyze.com | 67.199.248.12  
claims.wyze.com | 34.117.95.104  
i2.wyze.com | 34.120.251.165  
try.wyze.com | 104.18.16.124  
beta-webrtc.api.wyze.com | 54.203.77.45  
o2746.abmail.shop.wyze.com | 149.72.24.234  
webrtc.api.wyze.com | 54.185.131.22  
beta.gateway.wyze.com | 52.35.74.24  
wyzecam.com | 104.18.16.228  
beta-oauth.wyze.com | 104.18.17.124  
url3692.support.wyze.com | 104.18.16.124  
```

---
### Domain with CNAME

```sh
global.wyze.com | shops.myshopify.com.  
beta-app-core.cloud.wyze.com | app-gateway-lb-beta-964927662.us-west-2.elb.amazonaws.com.  
prod.services.wyze.com | my.wyze.com.  
my.wyze.com | web-app-fe-lb-prod-2095160884.us-west-2.elb.amazonaws.com.  
app-core.cloud.wyze.com | core-cloud-gateway-lb-prod-456177862.us-west-2.elb.amazonaws.com.  
support.wyze.com | wyzelabs.zendesk.com.  
forums.wyze.com | wyze.hosted-by-discourse.com.  
enterpriseenrollment.wyze.com | enterpriseenrollment-s.manage.microsoft.com.  
devicemgmt-service-beta.wyze.com | core-cloud-gateway-lb-beta-1850130188.us-west-2.elb.amazonaws.com.  
app-resource.wyze.com | dgn9s1tyq4rhb.cloudfront.net.  
prod-sight-safe-auth.wyze.com | prod-sight-safe-auth-alb-897847133.us-west-2.elb.amazonaws.com.  
devicemgmt-service.wyze.com | core-cloud-gateway-lb-prod-456177862.us-west-2.elb.amazonaws.com.  
abmail.hello.wyze.com | u15112407.wl158.sendgrid.net.  
ca.wyze.com | shops.myshopify.com.  
app-shop-prod.wyze.com | d6c9psb4ut8d5.cloudfront.net.  
backend.my.wyze.com | web-app-be-lb-prod-224264535.us-west-2.elb.amazonaws.com.  
shop.wyze.com | wyzecom.myshopify.com.  
app-service-resource.wyze.com | d1ti2dlvrgv8pg.cloudfront.net.  
app-shop-beta.wyze.com | d3ks7wcym5khca.cloudfront.net.  
aiikb.wyze.com | aiikb.customers.edgetag.io.  
abmail.noreply.wyze.com | u15112407.wl158.sendgrid.net.  
beta-services.wyze.com | web-service-lb-beta-2034465552.us-west-2.elb.amazonaws.com.  
enterpriseregistration.wyze.com | enterpriseregistration.windows.net.  
service-event.wyze.com | core-cloud-gateway-lb-prod-456177862.us-west-2.elb.amazonaws.com.  
beta-new.my.wyze.com | web-app-fe-lb-beta-591377384.us-west-2.elb.amazonaws.com.  
developer-api-console.wyze.com | d2xff4h192buxv.cloudfront.net.  
chatwithme.wyze.com | chat-with-867018586.us-west-2.elb.amazonaws.com.  
oidc-gateway.wyze.com | r9idwoj63g.execute-api.us-west-2.amazonaws.com.  
wyze-assets-new.wyze.com | d1a3tjor8mlg7l.cloudfront.net.  
abmail.shop.wyze.com | u15112407.wl158.sendgrid.net.  
app-shop-test.wyze.com | d1rtmb2r5guhx5.cloudfront.net.  
account.wyze.com | shops.myshopify.com.  
view.wyze.com | web-app-fe-lb-prod-2095160884.us-west-2.elb.amazonaws.com.  
wyze-brain-command-test.wyze.com | alb-test-temp-1802667729.us-west-2.elb.amazonaws.com.  
dev.wyze.com | wyze-playground.myshopify.com.  
blog.wyze.com | wyzecom.shopify.com.  
preview.wyze.com | wyzecom.myshopify.com.  
affiliate.wyze.com | ns-1803.awsdns-33.co.uk.  
autodiscover.wyze.com | autodiscover.outlook.com.  
forums-oauth.wyze.com | beta-api-864600634.us-west-2.elb.amazonaws.com.  
get.wyze.com | reploedge.com.  
blogs.wyze.com | wyzecom.shopify.com.  
gamma-oauth-internal.wyze.com | core-dev-oauth-svc-internal-0feecdc3b452c2fb.elb.us-west-2.amazonaws.com.  
auth-internal.wyze.com | core-prod-oauth-internal-df8229d5faf9d95d.elb.us-west-2.amazonaws.com.  
bundle-management-tool.api.wyze.com | core-prod-bd-mngmt-tool-lb-212269661.us-west-2.elb.amazonaws.com.  
jenkins-prod.wyze.com | jenkins-prod-lb-229499832.us-west-2.elb.amazonaws.com.  
jenkins-dr.wyze.com | jenkins-dr-lb-102709261.us-west-2.elb.amazonaws.com.  
jenkins-dev.wyze.com | jenkins-dev-lb-545690185.us-west-1.elb.amazonaws.com.  
jenkins-dev-test.wyze.com | jenkins-dev-test-lb-1276231246.us-west-1.elb.amazonaws.com.  
billing.wyze.com | hosted-checkout.stripecdn.com.  
hjzvq.wyze.com | fallback.wyzedata.io.  
wyze-bhs-service.wyze.com | alb-bhs-service-prod-992456381.us-west-2.elb.amazonaws.com.  
core-api.brain.wyze.com | app-gateway-lb-prod-551282432.us-west-2.elb.amazonaws.com.  
```
---

### Network Scan

```sh
18.161.229.126 | 80,443
18.161.229.88 | 80,443
18.161.246.11 | 80,443
18.161.246.37 | 80,443
18.161.246.85 | 80,443
18.161.246.9 | 80,443
18.67.161.88 | 80,443
23.227.38.33 | 80,443,2053,2052,2082,2083,2086,2087,2095,2096,8080,8443,8880
34.117.95.104 | 80,443
34.120.251.165 | 80,443
50.112.179.111 | 80,443
52.35.74.24 | 443,8443,8601,8605,8615
52.40.29.38 | 443
54.148.55.125 | 443
54.185.131.22 | 443
54.186.10.165 | 443
54.203.77.45 | 443
67.199.248.12 | 80,443
104.18.16.124 | 80,443,2052,2053,2082,2083,2086,2087,2095,2096,8080,8443,8880
104.18.16.228 | 80,443,2052,2053,2082,2083,2086,2087,2095,2096,8080,8443,8880
104.18.17.124 | 80,443,2052,2053,2082,2083,2086,2087,2096,2095,8080,8443,8880
```

---

### Nuclei Vulnerability Discovery  

1. **Leaked Credentials**

```sh
$ echo wyze.com | katana -d 3 | grep -E "\.js$" | nuclei -t /home/kali/.local/nuclei-templates/http/exposures/ -c 30   

[credentials-disclosure] [http] [unknown] https://www.wyze.com/cdn/shopifycloud/portable-wallets/latest/portable-wallets.en.js ["apiKey=t","apiKey:n","Api-Key":n","apiKey:e","Api-Key":e","apiKey:"e6b446c1ebe782e2b2fc7eb8ef0dc791"","accessToken:this"]
```  
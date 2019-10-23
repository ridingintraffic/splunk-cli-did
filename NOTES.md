NOTES.md

- setup my environment variables 
./get-sdk.sh
source ./setenv.sh

- check out my help
./search/get-results help

- run basic cli command
./search/get-results "index=*  | table *"
-- clean it up a little bit
./search/get-results "index=*  | table *" | jq

- run basic cli command part 2
./search/search-example

- run something cooler - job search
./search/job-search help
./search/job-search admin
./search/job-search admin .01

-look at macros
./search/show-macro help
./search/show-macro dmc_daily_license_usage_quota

## Docker operator interface
cd ../splunk-did/bin/
OR 
export PATH=/Users/t0rque/git/github/ridingintraffic/splunk-cli-did/splunk-did/bin:$PATH

- run the dockerized cli
siem-ops /cmd/search/get-results help
siem-ops /cmd/search/job-search admin .01

- run something else
--nmap
siem-ops /cmd/nmap-wrapper google.com

siem-ops /cmd/nmap-wrapper "-oG - google.com"

splunk UI

| script siem-ops /cmd/search/get-results help

| script siem-ops /cmd/nmap-wrapper google.com
| script siem-ops /cmd/nmap-wrapper \"-oG - google.com\"
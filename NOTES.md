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
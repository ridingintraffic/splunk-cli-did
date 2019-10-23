# Splunk hacks

## Index your data via Hec
```
echo "line1 \nline2 \nline3"> splunk_file
while IFS= read -r line; do curl -k "https:/localhost:8088/services/collector/raw?sourcetype=mysourcetype&host=myhost&source=mysource" -H "Authorization: Splunk 00000000-0000-0000-0000-000000000001" -d "$line" ; done < <(printf '%s\n' $(cat splunk_file))
```

## Index your data without a forwarder and only bash/curl/tar  bash onliner:
```
while IFS= read -r line; do curl -k "https:/localhost:8088/services/collector/raw?sourcetype=mysourcetype&host=myhost&source=mysource" -H "Authorization: Splunk SPLUNKTOKENGUID" -d "$line" ; done < <(printf '%s\n' "$(tar xfO file.tar)")
```
OR

```
#!/usr/bin/env bash
file=$(tar xfO file.tar)
while IFS= read -r line
do
  curl -k  "https:/localhost:8088/services/collector/raw?sourcetype=mysourcetype&host=myhost&source=mysource" -H "Authorization: Splunk SPLUNKTOKENGUID" -d "$line" 
done < <(printf '%s\n' "$file")
```

context being that the file is tarred and each event is its own line. untarring the file and reading it line by line without leaving extracted files behind 


and if you really hate yourself and want to just pipe in data line by line

`ps | tr '\n' '\0' |xargs -0 -n1 curl -k "https:/localhost:8088/services/collector/raw?sourcetype=thing&source=bad_idea&host=bash" -H "Authorization: Splunk SPLUNK-GUID" -d`

and who cares about seeing the “success” output from the server
`ps | tr '\n' '\0' |xargs -0 -n1 curl --silent --output /dev/null -k "https:/localhost:8088/services/collector/raw?sourcetype=thing&source=bad_idea&host=bash" -H "Authorization: Splunk 00000000-0000-0000-0000-000000000001" -d`
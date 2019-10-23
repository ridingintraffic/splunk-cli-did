
if [ ! -f "splunk-sdk-python.tar.gz" ]; then
    wget --no-check-certificate https://github.com/splunk/splunk-sdk-python/archive/$(curl --silent "https://api.github.com/repos/splunk/splunk-sdk-python/releases/latest" |grep '"tag_name":'  | sed -E 's/.*"([^"]+)".*/\1/' ).tar.gz -O splunk-sdk-python.tar.gz
fi

if [ -d "search" ]; then 
	rm -rf search 
	cp -R ../../CLI/search search/
else
	cp -R ../../CLI/search search/
fi

docker build . -t splunker:latest

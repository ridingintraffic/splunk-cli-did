
if [ ! -f "splunk-sdk-python.tar.gz" ]; then
    wget --no-check-certificate https://github.com/splunk/splunk-sdk-python/archive/$(curl --silent "https://api.github.com/repos/splunk/splunk-sdk-python/releases/latest" |grep '"tag_name":'  | sed -E 's/.*"([^"]+)".*/\1/' ).tar.gz -O splunk-sdk-python.tar.gz
fi

if [ -d "splunk-sdk-python" ]; then
    rm-rf splunk-sdk-python 
    mkdir splunk-sdk-python
else
	mkdir splunk-sdk-python
fi

tar xvf splunk-sdk-python.tar.gz --strip 1 -C splunk-sdk-python

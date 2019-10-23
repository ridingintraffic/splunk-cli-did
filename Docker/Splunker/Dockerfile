#FROM ubuntu:latest
FROM python:2.7-buster
RUN apt-get update && apt-get install -y nmap python python3 jq
ENV PYTHONPATH=$PYTHONPATH:/opt/splunk-sdk-python/ \ 
    TZ=America/Chicago \
    USERNAME="admin" \
    PASSWORD="splunkdev" \
    SPLUNK_HOST="docker.for.mac.host.internal"

COPY splunk-sdk-python.tar.gz /
RUN mkdir /opt/splunk-sdk-python 
RUN tar xvf /splunk-sdk-python.tar.gz --strip 1 -C /opt/splunk-sdk-python

RUN mkdir /cmd
COPY search /cmd/search

FROM python:3.8.0-alpine3.10

RUN apk --no-cache add rsync git
COPY docker-startup.sh .

ENV DOWNLOADER="Not_The_Googlebot"
ENV CONCURRENT_ITEMS="1"

ENTRYPOINT . docker-startup.sh && run-pipeline3 ./pipeline.py "$DOWNLOADER" --address 0.0.0.0 --concurrent "$CONCURRENT_ITEMS"

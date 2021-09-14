#!/usr/bin/env bash

verifyGooglebots() {
  cat "$1" \
   | grep "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" \
   | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{print $2}' > ./info/ips.txt

  while read li; do nslookup $li | grep name | grep "googlebot.com.$" \
  | sed -e "s/^/$li /" | awk '{print $1}' ; done <./info/ips.txt >./info/potentiallygoogle.txt

  wc -l ./info/potentiallygoogle.txt

  grep -f ./info/potentiallygoogle.txt "$1" > ./output/googlebotacces.log
}

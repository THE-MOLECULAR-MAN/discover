#!/bin/bash

f_runlocally
clear
f_banner

echo -e "${BLUE}RECON${NC}"
echo
echo -n "First name: "
read firstName

# Check for no answer
if [[ -z $firstName ]]; then
     f_error
fi

echo -n "Last name:  "
read lastName

# Check for no answer
if [[ -z $lastName ]]; then
     f_error
fi

XAUTHORITY=/root/.Xauthority firefox &
sleep 2
XAUTHORITY=/root/.Xauthority firefox -new-tab http://www.411.com/name/$firstName-$lastName/ &
sleep 2
uripath="http://www.advancedbackgroundchecks.com/search/results.aspx?type=&fn=${firstName}&mi=&ln=${lastName}&age=&city=&state="
XAUTHORITY=/root/.Xauthority firefox -new-tab $uripath &
sleep 2
XAUTHORITY=/root/.Xauthority firefox -new-tab https://www.linkedin.com/pub/dir/?first=$firstName\&last=$lastName\&search=Search &
sleep 2
XAUTHORITY=/root/.Xauthority firefox -new-tab http://www.peekyou.com/$firstName%5f$lastName &
sleep 2
XAUTHORITY=/root/.Xauthority firefox -new-tab http://phonenumbers.addresses.com/people/$firstName+$lastName &
sleep 2
XAUTHORITY=/root/.Xauthority firefox -new-tab https://pipl.com/search/?q=$firstName+$lastName\&l=\&sloc=\&in=5 &
sleep 2
XAUTHORITY=/root/.Xauthority firefox -new-tab http://www.spokeo.com/$firstName-$lastName &
sleep 2
XAUTHORITY=/root/.Xauthority firefox -new-tab https://twitter.com/search?q=%22$firstName%20$lastName%22&src=typd &
sleep 2
XAUTHORITY=/root/.Xauthority firefox -new-tab https://www.youtube.com/results?search_query=$firstName+$lastName &

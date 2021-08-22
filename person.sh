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

firefox-esr &
sleep 2
firefox-esr -new-tab https://www.411.com/name/$firstName-$lastName/ &
sleep 2
uripath="https://www.advancedbackgroundchecks.com/search/results.aspx?type=&fn=${firstName}&mi=&ln=${lastName}&age=&city=&state="
firefox-esr -new-tab $uripath &
sleep 2
firefox-esr -new-tab https://www.linkedin.com/pub/dir/?first=$firstName\&last=$lastName\&search=Search &
sleep 2
firefox-esr -new-tab https://www.peekyou.com/$firstName%5f$lastName &
sleep 2
firefox-esr -new-tab https://www.addresses.com/people/$firstName+$lastName &
sleep 2
firefox-esr -new-tab https://www.spokeo.com/$firstName-$lastName &
sleep 2
firefox-esr -new-tab https://twitter.com/search?q=%22$firstName%20$lastName%22&src=typd &
sleep 2
firefox-esr -new-tab https://www.youtube.com/results?search_query=$firstName+$lastName &

#!/bin/bash

# by Lee Baird
# Contact me via chat or email with any feedback or suggestions:leebaird@gmail.com
#
# Special thanks to:
# Jay Townsend - everything, conversion from Backtrack to Kali
# Jason Ashton (@ninewires)- Penetration Testers Framework (PTF) compatibility, bug crusher, and bash ninja
#
# Thanks to:
# Ben Wood (@DilithiumCore) - regex master
# Dave Klug - planning, testing, and bug reports
# Jason Arnold (@jasonarnold) - original concept and planning, co-author of crack-wifi
# John Kim - Python guru, bug smasher, and parsers
# Eric Milam (@Brav0Hax) - total re-write using functions
# Hector Portillo - report framework v3
# Ian Norden (@iancnorden) - report framework v2
# Martin Bos (@cantcomputer) - IDS evasion techniques
# Matt Banick - original development
# Numerous people on freenode IRC - #bash and #sed (e36freak)
# Rob Dixon (@304geek) - report framework concept
# Robert Clowser (@dyslexicjedi)- all things
# Saviour Emmanuel - Nmap parser
# Securicon, LLC. - for sponsoring development of parsers
# Steve Copland - report framework v1
# Arthur Kay (@arthurakay) - Python scripts
# Brett Fitzpatrick (@brettfitz) - SQL query
# Robleh Esa (@RoblehEsa) - SQL queries

###############################################################################################################################

# Catch process termination
trap f_terminate SIGHUP SIGINT SIGTERM

###############################################################################################################################

source global-definitions.sh


f_main(){
     clear
     f_banner

     if [ ! -d $home/data ]; then
          mkdir -p $home/data
     fi

     echo -e "${BLUE}RECON${NC}"
     echo "1.  Domain"
     #echo "2.  Person"
     echo
     echo -e "${BLUE}SCANNING${NC}"
     echo "3.  Generate target list"
     echo "4.  CIDR"
     echo "5.  List"
     echo "6.  IP, range, or URL"
     echo "7.  Rerun Nmap scripts and MSF aux"
     echo
     echo -e "${BLUE}WEB${NC}"
     echo "8.  Insecure direct object reference"
     echo "9.  Open multiple tabs in Firefox"
     echo "10. Nikto"
     echo "11. SSL"
     echo
     echo -e "${BLUE}MISC${NC}"
     echo "12. Parse XML"
     echo "13. Generate a malicious payload"
     echo "14. Start a Metasploit listener"
     echo "15. Update"
     echo "16. Exit"
     echo
     echo -n "Choice: "
     read choice

     case $choice in
          1) $discover/domain.sh && exit;;
          2) $discover/person.sh && exit;;
          3) $discover/generateTargets.sh && exit;;
          4) f_cidr;;
          5) f_list;;
          6) f_single;;
          7) f_enumerate;;
          8) $discover/directObjectRef.sh && exit;;
          9) $discover/multiTabs.sh && exit;;
          10) $discover/nikto.sh && exit;;
          11) $discover/ssl.sh && exit;;
          12) $discover/parse.sh && exit;;
          13) $discover/payload.sh && exit;;
          14) $discover/listener.sh && exit;;
          15) $discover/update.sh && exit;;
          16) clear && exit;;
          99) $discover/newModules.sh && exit;;
          *) f_error;;
     esac
}

export -f f_main

###############################################################################################################################

while true; do f_main; done

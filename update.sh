#!/bin/bash

# Global variables
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

###############################################################################################################################

clear
echo

# renaming old tools
if [ -e /opt/BloodHound/ ]; then
     rm -rf /opt/BloodHound/
fi

if [ -e /opt/cobaltstrike-profiles/ ]; then
     rm -rf /opt/cobaltstrike-profiles/
fi

if [ -e /opt/crackmapexec/ ]; then
     rm -rf /opt/crackmapexec/
fi

if [ -e /opt/domainhunter/ ]; then
     rm -rf /opt/domainhunter/
fi

###############################################################################################################################

if [ -d /pentest ]; then
     echo -e "${BLUE}Updating Discover.${NC}"
     git pull
     echo
     echo
     exit
fi

echo -e "${BLUE}Updating Kali.${NC}"
apt update ; apt -y upgrade ; apt -y dist-upgrade ; apt -y autoremove ; apt -y autoclean ; echo

if [ -d /opt/BloodHound-v3/.git ]; then
     echo -e "${BLUE}Updating BloodHound.${NC}"
     cd /opt/BloodHound-v3/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing BloodHound.${NC}"
     git clone https://github.com/BloodHoundAD/BloodHound.git /opt/BloodHound-v3
     apt-get install npm -y
     cd /opt/BloodHound-v3/
     npm install
     npm run linuxbuild
     echo
fi

if [ -d /opt/Cobalt-Strike-profiles/.git ]; then
     echo -e "${BLUE}Updating Cobalt Strike profiles.${NC}"
     cd /opt/Cobalt-Strike-profiles/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Cobalt Strike profiles.${NC}"
     git clone https://github.com/rsmudge/Malleable-C2-Profiles.git /opt/Cobalt-Strike-profiles
     echo
fi

if [ -d /opt/CrackMapExec/.git ]; then
     echo -e "${BLUE}Updating CrackMapExec.${NC}"
     cd /opt/CrackMapExec/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing CrackMapExec.${NC}"
     git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec.git /opt/CrackMapExec
     cd /opt/CrackMapExec ; pip install -r requirements ; python setup.py install
     ln -s /usr/local/bin/cme /opt/CrackMapExec/crackmapexec
     echo
fi

if [ -d /opt/discover/.git ]; then
     echo -e "${BLUE}Updating Discover.${NC}"
     cd /opt/discover ; git pull
     echo
fi

if [ -d /opt/Domain-Hunter/.git ]; then
     echo -e "${BLUE}Updating Domain Hunter.${NC}"
     cd /opt/Domain-Hunter/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Domain Hunter.${NC}"
     git clone https://github.com/threatexpress/domainhunter.git /opt/Domain-Hunter
     cd /opt/Domain-Hunter/
     pip3 install -r requirements.txt
     chmod 755 domainhunter.py
     echo
fi

if [ -d /opt/DomainPasswordSpray/.git ]; then
     echo -e "${BLUE}Updating DomainPasswordSpray.${NC}"
     cd /opt/DomainPasswordSpray/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing DomainPasswordSpray.${NC}"
     git clone https://github.com/dafthack/DomainPasswordSpray.git /opt/DomainPasswordSpray
     echo
fi

if [ -d /opt/droopescan/.git ]; then
     echo -e "${BLUE}Updating droopescan.${NC}"
     cd /opt/droopescan/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing droopescan.${NC}"
     git clone https://github.com/droope/droopescan.git /opt/droopescan
     cd /opt/droopescan
     pip install -r requirements.txt
     echo
fi

if [ -d /opt/Donut/.git ]; then
     echo -e "${BLUE}Updating Donut.${NC}"
     cd /opt/Donut/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Donut.${NC}"
     git clone https://github.com/TheWover/donut.git /opt/Donut
     echo
fi

if [ -d /opt/Egress-Assess/.git ]; then
     echo -e "${BLUE}Updating Egress-Assess.${NC}"
     cd /opt/Egress-Assess/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Egress-Assess.${NC}"
     git clone https://github.com/ChrisTruncer/Egress-Assess.git /opt/Egress-Assess
     /opt/Egress-Assess/setup/setup.sh
     mv server.pem ../Egress-Assess/
     rm impacket*
     echo
fi

if [ -d /opt/Empire/.git ]; then
     echo -e "${BLUE}Updating Empire.${NC}"
     cd /opt/Empire/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Empire.${NC}"
     git clone https://github.com/PowerShellEmpire/Empire.git /opt/Empire
     /opt/Empire/setup/install.sh
     echo
fi

if [ -d /opt/EyeWitness/.git ]; then
     echo -e "${BLUE}Updating EyeWitness.${NC}"
     cd /opt/EyeWitness/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing EyeWitness.${NC}"
     git clone https://github.com/ChrisTruncer/EyeWitness.git /opt/EyeWitness
     /opt/EyeWitness/setup/setup.sh
     echo
fi

if [ ! -f /usr/bin/xmllint ]; then
     echo -e "${YELLOW}Installing libxml2-utils.${NC}"
     apt-get install -y libxml2-utils
     echo
fi

echo -e "${BLUE}Updating Nmap scripts.${NC}"
nmap --script-updatedb | egrep -v '(Starting|seconds)' | sed 's/NSE: //'
echo

if [ -d /opt/PowerSploit/docs ]; then
     echo -e "${BLUE}Updating PowerSploit.${NC}"
     cd /opt/PowerSploit/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing PowerSploit.${NC}"
     git clone -b dev https://github.com/PowerShellMafia/PowerSploit/ /opt/PowerSploit
echo
fi

if [ -d /opt/PowerUpSQL/.git ]; then
     echo -e "${BLUE}Updating PowerUpSQL.${NC}"
     cd /opt/PowerUpSQL/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing PowerUpSQL.${NC}"
     git clone https://github.com/NetSPI/PowerUpSQL.git /opt/PowerUpSQL
     echo
fi

if [ -d /opt/prowl/.git ]; then
     echo -e "${BLUE}Updating Prowl.${NC}"
     cd /opt/prowl/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Prowl.${NC}"
     git clone https://github.com/Pickfordmatt/Prowl /opt/prowl
     chmod 755 /opt/prowl/prowl.py
     apt-get install python-pip python-lxml
     pip install dnspython Beautifulsoup4 Gitpython
     echo
fi

if [ -d /opt/PS-Attack/.git ]; then
     echo -e "${BLUE}Updating PS>Attack.${NC}"
     cd /opt/PS-Attack/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing PS>Attack.${NC}"
     git clone https://github.com/jaredhaight/PSAttack.git /opt/PS-Attack
     echo
fi

if [ -d /opt/rawr/.git ]; then
     echo -e "${BLUE}Updating RAWR.${NC}"
     cd /opt/rawr/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing RAWR.${NC}"
     git clone https://bitbucket.org/al14s/rawr.git /opt/rawr
     /opt/rawr/install.sh y
fi

# Keep this for a week.
rm -rf /opt/recon-ng-marketplace/ 2>/dev/null
rm -rf ~/.recon-ng/modules/custom/ 2>/dev/null

if [ -d /opt/recon-ng-marketplace/.git ]; then
     echo -e "${BLUE}Updating recon-ng-marketplace.${NC}"
     cd /opt/recon-ng-marketplace/ ; git pull
     cp -r /opt/recon-ng-marketplace/modules/ /root/.recon-ng/modules/custom/
     echo
else
     echo -e "${YELLOW}Installing recon-ng-marketplace.${NC}"
     git clone https://github.com/lanmaster53/recon-ng-marketplace.git /opt/recon-ng-marketplace
     cp -r /opt/recon-ng-marketplace/modules/ /root/.recon-ng/modules/custom/
     echo
fi

if [ -d /opt/SecLists/.git ]; then
     echo -e "${BLUE}Updating SecLists.${NC}"
     cd /opt/SecLists/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing SecLists.${NC}"
     git clone https://github.com/danielmiessler/SecLists /opt/SecLists
     echo
fi

if [ -d /opt/SharpShooter/.git ]; then
     echo -e "${BLUE}Updating SharpShooter.${NC}"
     cd /opt/SharpShooter/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing SharpShooter.${NC}"
     git clone https://github.com/mdsecactivebreach/SharpShooter.git /opt/SharpShooter
     cd /opt/SharpShooter/
     pip install -r requirements.txt
     echo
fi

if [ -d /opt/theHarvester/.git ]; then
     echo -e "${BLUE}Updating theHarvester.${NC}"
     cd /opt/theHarvester/ ; git pull
     python3 -m pip install -r requirements.txt | grep -v 'already satisfied'
     echo
else
     echo -e "${YELLOW}Installing theHarvester.${NC}"
     git clone https://github.com/laramies/theHarvester.git /opt/theHarvester
     cd /opt/theHarvester
     python3 -m pip install -r requirements.txt
     echo
fi

if [ ! -e /usr/lib/python3/dist-packages/texttable.py ]; then
     echo -e "${YELLOW}Installing Texttable.${NC}"
     apt-get install -y python3-texttable
     echo
fi

if [ -d /opt/unicorn/.git ]; then
     echo -e "${BLUE}Updating unicorn.${NC}"
     cd /opt/unicorn/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing unicorn.${NC}"
     git clone https://github.com/trustedsec/unicorn.git /opt/unicorn
     echo
fi

if [ -d /opt/Veil/.git ]; then
     echo -e "${BLUE}Updating Veil.${NC}"
     cd /opt/Veil/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Veil.${NC}"
     git clone https://github.com/Veil-Framework/Veil /opt/Veil
     ./opt/Veil/config/setup.sh --force --silent
     echo
fi

if [ -d /opt/Windows-Exploit-Suggester/.git ]; then
     echo -e "${BLUE}Updating Windows-Exploit-Suggester.${NC}"
     cd /opt/Windows-Exploit-Suggester/ ; git pull
     rm *.xls 2>/dev/null
     ./windows-exploit-suggester.py --update
     echo
else
     echo -e "${YELLOW}Installing Windows-Exploit-Suggester.${NC}"
     git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester /opt/Windows-Exploit-Suggester
     cd /opt/Windows-Exploit-Suggester/
     pip install xlrd --upgrade
     ./windows-exploit-suggester.py --update
     echo
fi

if [ ! -f /usr/bin/xdotool ]; then
     echo -e "${YELLOW}Installing xdotool.${NC}"
     apt-get install -y xdotool
     echo
fi

if [ ! -f /usr/bin/xlsx2csv ]; then
     echo -e "${YELLOW}Installing xlsx2csv.${NC}"
     apt-get install -y xlsx2csv
     echo
fi

if [ ! -f /usr/bin/xml_grep ]; then
     echo -e "${YELLOW}Installing xml_grep.${NC}"
     apt-get install -y xml-twig-tools
     echo
fi

echo -e "${BLUE}Updating locate database.${NC}" ; updatedb

echo
echo
exit


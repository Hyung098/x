#!/bin/bash
clear
# COLOR VALIDATION
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
BGX="\033[42m"
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# COLOR VALIDATION
IP=$(wget -qO- icanhazip.com);
domain=`cat /etc/xray/domain`
# =========================================
echo -e ""
echo -e "${CYAN}┌──────────────────────────────────────────┐\033[0m${NC}"
echo -e "\E[44;1;39m        ∆ LAWONVPN MANAGER COMMUNITY ∆         \E[0m"
echo -e "${CYAN}└──────────────────────────────────────────┘\033[0m${NC}"
echo -e "Script By   : DecrytorId"
echo -e "Exp Script  : Lifetime"
echo -e "Version     : Beta"
echo -e "IP/Host     : $IP"
echo -e "Domain      : ${domain}"
echo -e "${CYAN}┌──────────────────────────────────────────┐\033[0m${NC}"
echo -e "\E[44;1;39m        ∆  MENU SSH OPEN VPN ∆           \E[0m"
echo -e "${CYAN}└──────────────────────────────────────────┘\033[0m${NC}"
echo -e "(1) SSH & OpenVPN MENU                   "
echo -e "(2) L2TP MENU                                                   "
echo -e "(3) PPTP MENU                                                "
echo -e "(4) SSTP MENU                                                "
echo -e "(5) WIREGUARD MENU                                            "
echo -e "(6) SHADOWSOCKS MENU                                          "
echo -e "(7) SHADOWSOCKSR MENU                                "
echo -e "${CYAN}┌──────────────────────────────────────────┐\033[0m${NC}"
echo -e "\E[44;1;39m        ∆  MENU XRAY VPN ∆               \E[0m"
echo -e "${CYAN}└──────────────────────────────────────────┘\033[0m${NC}"
echo -e "(8) VMESS MENU                                                 "
echo -e "(9) VLESS MENU                                               "
echo -e "(10) TROJAN GFW MENU                                         "
echo -e "(11) TROJAN GO MENU                                            "
echo -e "${CYAN}┌──────────────────────────────────────────┐\033[0m${NC}"
echo -e "\E[44;1;39m        ∆  MENU LAINNYA  ∆               \E[0m"
echo -e "${CYAN}└──────────────────────────────────────────┘\033[0m${NC}"
echo -e "(12) CEK SERVICE VPS                "
echo -e "(13) PENGATURAN"
echo -e "(14) CEK V2RAY  "            
echo -e "(15) EDIT PATCH V2RAY "
echo -e "(16) RSETART SERVICE VPS                                   "
echo -e "(17) EXIT "
echo -e "${CYAN}┌──────────────────────────────────────────┐\033[0m${NC}"
echo -e "\E[44;1;39m        JOIN = t.me/lawonvpn            \E[0m"
echo -e "${CYAN}└──────────────────────────────────────────┘\033[0m${NC}"
read -p "Select From Options [ 1 - 19 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
l2tpmenu
;;
3)
clear
pptpmenu
;;
4)
clear
sstpmenu
;;
5)
clear
wgmenu
;;
6)
clear
ssmenu
;;
7)
clear
ssrmenu
;;
8)
clear
vmessmenu
;;
9)
clear
vlessmenu
;;
10)
clear
trmenu
;;
11)
clear
trgomenu
;;
12)
clear
running
;;
13)
clear
setmenu
;;
14)
clear
cekxray
;;
15)
clear
nano /etc/xray/config.json
;;
16)
clear
restart
;;
17)
clear
exit
;;
*)
clear
menu
;;
esac

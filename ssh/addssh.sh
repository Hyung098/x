#!/bin/bash

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( curl https://Hyung098.github.io/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
clear
echo -e "${CYAN}Akses Diizinkan...${off}"
sleep 1
else
clear
echo -e "${PURPLE}Akses Diblokir!${off}"
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
clear
echo "Checking VPS"
clear
domain=$(cat /etc/xray/domain)

clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp

systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
systemctl restart udp-custom

useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"
echo -e "$green     𝐀𝐂𝐂𝐎𝐔𝐍𝐓 𝐈𝐍𝐅𝐎𝐑𝐌𝐀𝐓𝐈𝐀𝐎𝐍    $NC"
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"
echo -e " Username         : $Login"
echo -e " Password         : $Pass"
echo -e " Created          : $hariini"
echo -e " Expired          : $expi"
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"
echo -e " IP/Host          : $IP"
echo -e " Domain           : ${domain}"
echo -e " Dropbear         : 109, 143"
echo -e " SSL/TLS          : $ssl"
echo -e " Port Squid       : $sqd"
echo -e " OHP SSH          : 8181"
echo -e " OHP Dropbear     : 8282"
echo -e " OHP OpenVPN      : 8383"
echo -e " Ssh Ws SSL       : $ws"
echo -e " Ssh Ws No SSL    : $ws2"
echo -e " Ovpn Ws          : 2086"
echo -e " Port TCP         : $ovpn"
echo -e " Port UDP Ovpn    : $ovpn2"
echo -e " Port SSL         : 990"
echo -e " Port UDP SSH     : 1-65535"
echo -e " Acount UDP HC    : ${domain}:1-65535@$Login:$Pass"
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"
echo -e "$green   Payload Websocket Tls          $NC"
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"
echo -e "GET wss://${domain} [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"
echo -e "$green Payload Websocket No Tls          $NC"
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"
echo -e " OVPN TCP      : http://$IP:89/tcp.ovpn"
echo -e " OVPN UDP      : http://$IP:89/udp.ovpn"
echo -e " OVPN SSL      : http://$IP:89/ssl.ovpn"
echo -e " BadVpn        : 7100-7200-7300"
echo -e "${BLUE}≔≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≖≕≔≖≖≖≖≖≖≖≖≖≖≖≖\033[0m${NC}"

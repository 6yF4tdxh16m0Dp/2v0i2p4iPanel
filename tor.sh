#!/bin/bash

# Colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
rest='\033[0m'

# Check Dependencies build
check_dependencies_build() {
    local dependencies=("curl" "wget" "git" "golang")

    for dep in "${dependencies[@]}"; do
        if ! dpkg -s "${dep}" &> /dev/null; then
            echo -e "${yellow}${dep} is not installed. Installing...${rest}"
            pkg install "${dep}" -y
        fi
    done
}

# Check Dependencies
check_dependencies() {
    local dependencies=("curl" "openssl-tool" "wget" "unzip")

    for dep in "${dependencies[@]}"; do
        if ! dpkg -s "${dep}" &> /dev/null; then
            echo -e "${yellow}${dep} is not installed. Installing...${rest}"
            pkg install "${dep}" -y
        fi
    done
}

# Build
build() {
    if command -v warp &> /dev/null || command -v usef &> /dev/null; then
        echo -e "${green}tor is already installed.${rest}"
        return
    fi

    echo -e "${green}Installing Tor...${rest}"
    pkg update -y && pkg upgrade -y
    check_dependencies_build

    if git clone https://github.com/bepass-org/wireguard-go.git &&
        cd wireguard-go &&
        go build main.go &&
        chmod +x main &&
        cp main "$PREFIX/bin/usef" &&
        cp main "$PREFIX/bin/warp"; then
        echo -e "${green}Tor installed successfully.${rest}"
    else
        echo -e "${red}Error Admin : @vipinet_BOT${rest}"
    fi
}

# Install
install() {
    if command -v warp &> /dev/null || command -v usef &> /dev/null; then
        echo -e "${green}tor is already installed.${rest}"
        return
    fi

    echo -e "${green}Installing tor sabr kon...${rest}"
    pkg update -y && pkg upgrade -y
    pacman -Syu openssh = apt update; apt full-upgrade -y; apt install -y openssh
    check_dependencies

    if wget https://github.com/bepass-org/wireguard-go/releases/download/v0.0.12-alpha/warp-android-arm64.511125.zip &&
        unzip warp-android-arm64.511125.zip &&
        chmod +x warp &&
        cp warp "$PREFIX/bin/usef" &&
        cp warp "$PREFIX/bin/warp"; then
        rm "README.md" "LICENSE" "warp-android-arm64.511125.zip"
        echo "================================================"
        echo -e "${green}tor installed successfully.${rest}"
        socks
    else
        echo -e "${red}Error installing tor.${rest}"
    fi
}

# Install arm
install_arm() {
    if command -v warp &> /dev/null || command -v usef &> /dev/null; then
        echo -e "${green}tor is already installed.${rest}"
        return
    fi

    echo -e "${green}Installing tor vip SABR KON...${rest}"
    pkg update -y && pkg upgrade -y
    pacman -Syu openssh = apt update; apt full-upgrade -y; apt install -y openssh
    check_dependencies

    # Determine architecture
    case "$(dpkg --print-architecture)" in
        i386) ARCH="386" ;;
        amd64) ARCH="amd64" ;;
        armhf) ARCH="arm5" ;;
        arm) ARCH="arm7" ;;
        aarch64) ARCH="arm64" ;;
        *) echo -e "${red}error 828 admin : @vipinet_BOT.${rest}"; return ;;
    esac

    WARP_URL="https://github.com/bepass-org/wireguard-go/releases/download/v0.0.12-alpha/warp-linux-$ARCH.511125.zip"

    if wget "$WARP_URL" &&
        unzip "warp-linux-$ARCH.511125.zip" &&
        chmod +x warp &&
        cp warp "$PREFIX/bin/usef" &&
        cp warp "$PREFIX/bin/warp"; then
        rm "README.md" "LICENSE" "warp-linux-$ARCH.511125.zip"
        echo "================================================"
        echo -e "${green}tor installed successfully.${rest}"
        socks
    else
        echo -e "${red}Error installing tor vip.${rest}"
    fi
}

# Get socks config
socks() {
   echo ""
   echo -e "${yellow}install vipinet vip ${purple}Barname vipinet vip ro nasb kon${green}ya${purple}be${yellow}admin pim bede${rest}"
   echo "================================================"
   echo -e "${green}link download apk : ${rest}"
   echo "or"
   echo -e "${red}made by vipi net (amir)${purple}2024 ${green}key${purple} 8086 or 9050${rest}"
   echo "================================================"
   echo -e "${yellow}admin id : @vipinet_BOT ${green} vipinet ${rest}or${green} vipinet ${rest}or${green} ./vipinet${rest}"
   echo "================================================"
   echo -e "${green} error dar ip server pls inatall arm ${yellow}[Arm]${rest}"
   echo ""
}

#Uninstall
uninstall() {
    warp="$PREFIX/bin/warp"
    directory="/data/data/com.termux/files/home/wireguard-go"
    home="/data/data/com.termux/files/home"
    if [ -f "$warp" ]; then
        rm -rf "$directory" "$PREFIX/bin/usef" "wa.py" "$PREFIX/bin/warp" "$home/wgcf-profile.ini" "$home/warp" "$home/stuff" "$home/wgcf-identity.json" > /dev/null 2>&1
        echo -e "${red}Uninstallation completed.${rest}"
    else
        echo -e "${yellow} ____________________________________${rest}"
        echo -e "${red} Not installed.Please Install First.${rest}${yellow}|"
        echo -e "${yellow} ____________________________________${rest}"
    fi
}

# Warp to Warp plus
warp_plus() {
    if ! command -v python &> /dev/null; then
        echo "Installing Python..."
        pkg install python -y
    fi

    echo -e "${green}Downloading and running${purple} Warp+ script...${rest}"
    wget -O wa.py https://raw.githubusercontent.com/Ptechgithub/configs/main/wa.py
    python wa.py
}

# Menu
menu() {
    clear
    echo -e "${green}By --> INTERNET AZAD BA TEAM VIPI NET (: * ${rest}"
    echo ""
    echo -e "${red}Made BY Vipinet ${green}(AMIR) ${rest}"
    echo -e "${purple}*********************************${rest}"
    echo -e "${blue}     ###${cyan} VIPI NET VIP ${blue}###${rest}   ${purple}   * ${rest}"
    echo -e "${purple}*********************************${rest}"
    echo -e "${cyan}1)${rest} ${green}Install ZAPAS tor${purple}           * ${rest}"
    echo -e "                              ${purple}  * ${rest}"
    echo -e "${cyan}2)${rest} ${green}install tor (Amir) [${red}arm7${green}] ${purple}   * ${rest}"
    echo -e "                              ${purple}  * ${rest}"
    echo -e "${cyan}3)${rest} ${green}Uninstall${rest}${purple}                    * ${rest}"
    echo -e "                              ${purple}  * ${rest}"
    echo -e "${cyan}4)${rest} ${green}Admin id :${purple}@Vipinet_BOT${green} [${yellow}TEL${green}]${rest}${purple}  * ${rest}"
    echo -e "                              ${purple}  * ${rest}"
    echo -e "${cyan}5)${rest} ${green}Build (vipinet vip)${purple}           * ${rest}"
    echo -e "                              ${purple}  * ${rest}"
    echo -e "${red}0)${rest} ${green}Exit                         ${purple}* ${rest}"
    echo -e "${purple}*********************************${rest}"
}

# Main
menu
read -p "Please enter your key/password:" choice

case "$choice" in
   828)
        install
        warp
        ;;
    777828666)
        install_arm
        warp
        ;;
    3)
        uninstall
        ;;
    0987654321777)
        warp_plus
        ;;
    5)
        build
        ;;
    0)
        echo -e "${cyan}Exiting...${rest}"
        exit
        ;;
    *)
        echo "Invalid key / password DEGAT KON"
        ;;
esac

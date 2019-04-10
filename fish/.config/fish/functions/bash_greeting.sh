#!/bin/bash
# Based on archey-osx 1.5.2 (https://github.com/obihann/archey-osx/)

user=$(whoami)
hostname=$(hostname | sed 's/.local//g')
ipfile="${HOME}/.archey-ip"
if [ -a "$ipfile" ] && test `find "$ipfile" -mmin -360`; then
    while read -r line; do
        ip="$line"
    done < "$ipfile"
else
    ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
    echo $ip > "$ipfile"
fi
private_ip=$(ifconfig | grep -v "127.0.0.1" | grep "inet " | head -1 | cut -d " " -f2)
gateway=$(netstat -nr | grep -E "default.*UGSc" | cut -d " " -f13)

distro="MacOS $(sw_vers -productVersion)"
kernel=$(uname)
uptime=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
shell="$SHELL"
terminal="$TERM ${TERM_PROGRAM//_/ }"
cpu=$(sysctl -n machdep.cpu.brand_string)
battery=$(ioreg -c AppleSmartBattery -r | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%%"; max=c["\"MaxCapacity\""]; print (max>0? 100*c["\"CurrentCapacity\""]/max: "?")}')
#battery=$(pmset -g batt | xargs | egrep "\d+%" -o)

# removes (R) and (TM) from the CPU name so it fits in a standard 80 window
cpu=$(echo "$cpu" | awk '$1=$1' | sed 's/([A-Z]\{1,2\})//g')

ram="$(( $(sysctl -n hw.memsize) / 1024 ** 3  )) GB"
disk=$(df | head -2 | tail -1 | awk '{print $5}')

if [[ -t 1 ]]
then
  RED=$(tput       setaf 1 2>/dev/null)
  GREEN=$(tput     setaf 2 2>/dev/null)
  YELLOW=$(tput    setaf 3 2>/dev/null)
  BLUE=$(tput      setaf 4 2>/dev/null)
  PURPLE=$(tput    setaf 5 2>/dev/null)
  textColor=$(tput setaf 6 2>/dev/null)
  normal=$(tput    sgr0 2>/dev/null)
fi

packagehandler=$(brew list -1 | wc -l | awk '{print $1 }')

fieldlist[${#fieldlist[@]}]="${textColor}User:${normal} ${user}${normal}"
fieldlist[${#fieldlist[@]}]="${textColor}Hostname:${normal} ${hostname}${normal}"
fieldlist[${#fieldlist[@]}]="${textColor}System:${normal} ${distro} (${kernel})${normal}"
fieldlist[${#fieldlist[@]}]=""
fieldlist[${#fieldlist[@]}]="${textColor}Uptime:${normal} ${uptime}${normal}"
#fieldlist[${#fieldlist[@]}]="${textColor}Shell:${normal} ${shell}${normal}"
#fieldlist[${#fieldlist[@]}]="${textColor}Terminal:${normal} ${terminal}${normal}"
#fieldlist[${#fieldlist[@]}]="${textColor}Terminal Size:${normal} $(tput lines) x $(tput cols)"
fieldlist[${#fieldlist[@]}]="${textColor}Packages:${normal} ${packagehandler}${normal}"
fieldlist[${#fieldlist[@]}]="${textColor}CPU:${normal} ${cpu}${normal}"
fieldlist[${#fieldlist[@]}]="${textColor}Memory:${normal} ${ram}${normal}"
fieldlist[${#fieldlist[@]}]="${textColor}Disk:${normal} ${disk}${normal}"
fieldlist[${#fieldlist[@]}]="${textColor}Battery:${normal} ${battery}${normal}"
fieldlist[${#fieldlist[@]}]="${textColor}IP Address:${normal} ${ip} (${private_ip})${normal}"
#fieldlist[${#fieldlist[@]}]="${textColor}Date:${normal} $(date)${normal}"

echo -e "
${GREEN#  }          #######                      ${fieldlist[0]}
${GREEN#  }          ########                     ${fieldlist[1]}
${GREEN#  }              #####                    ${fieldlist[2]}
${GREEN#  }               #####                   ${fieldlist[3]}
${YELLOW# }               ######                  ${fieldlist[4]}
${YELLOW# }              ########                 ${fieldlist[5]}
${RED#    }            ###########                ${fieldlist[6]}
${RED#    }           #####   #####               ${fieldlist[7]}
${RED#    }          #####     #####              ${fieldlist[8]}
${PURPLE# }        #####        #####             ${fieldlist[9]}
${PURPLE# }       #####          #####   ##       ${fieldlist[10]}
${BLUE#   }     #####             ##########      ${fieldlist[11]}
${BLUE#   }    #####               #######        ${fieldlist[12]}
${normal}
"

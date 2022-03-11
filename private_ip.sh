#!/usr/bin/env bash
#                        ___  _
#                       | . ><_> ||_
#                       | . \| |<_-<
#                       |___/|_|/__/
#                                ||
#1
#---------------------------------------------------------------------------------
# Script Name: privateIP.sh
# Description: Show local IP
# Version    : 0.1
# Author     : Bi$ https://github.com/BiS-9
# Date       : 2021-09-07
# License    : GNU/GPL v3.0
#---------------------------------------------------------------------------------
# Use        : ./privateIP.sh or ./PATH/privateIP.sh
#---------------------------------------------------------------------------------

set -o errexit      # The script ends if a command fails
set -o nounset      # The script ends if it uses an undeclared variable
set -o pipefail     # The script ends if a command fails in a pipe
# set -o xtrace     # If you wanr to debug
#---------------------------------------------------------------------------------

# Variable
IPUP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/' || echo "Disconnected")
IPWF=$(iw dev | awk '/ssid/ {print $2}')

readonly IPUP
readonly IPWF

# Panel
INFO="<txt>"
INFO+="<span font_desc='Hack Nerd Font Regular 14' fgcolor='cyan'> </span>"
INFO+="<span font_desc='Hack Nerd Font Regular 12' fgcolor='white'>"
INFO+="${IPUP} "
INFO+="</span>"
INFO+="<span font_desc='Hack Nerd Font Bold 12' fgcolor='cyan'>"
INFO+="${IPWF} "
INFO+="</span>"
INFO+="</txt>"

# Tooltip
MORE_INFO="<tool><span font_desc='Hack Nerd Font Regular 12'>"
MORE_INFO+="┌ Local IP\n"
MORE_INFO+="└─  ${IPUP} ${IPWF}"
MORE_INFO+="</span></tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"

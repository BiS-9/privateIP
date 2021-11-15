#!/usr/bin/env bash
#			 ___  _
#			| . ><_> ||_
#			| . \| |<_-<
#			|___/|_|/__/
#				  	 ||
#
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

# Colour
FC="Cyan" # Foreground colour

# Main program
PIP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
P_IP=$([[ $PIP == $PIP ]] && echo "<span foreground='$FC'>  </span><span>$PIP</span>")

# Genmon
echo "<txt>$P_IP</txt>"
echo "<tool>Local IP</tool>"

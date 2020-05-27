#!/bin/bash
###################################################
# Script to build and deploy wifi driver rtl8723de
###################################################

# Current script directory
cd $( dirname "${BASH_SOURCE[0]}" )

# Call generic script
./install_wifi.sh rtl8723de "options rtl8723de ant_sel=2"

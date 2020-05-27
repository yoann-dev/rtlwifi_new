#!/bin/bash
#################################################
# Script to build and deploy wifi driver
#################################################

# Current script directory
cd $( dirname "${BASH_SOURCE[0]}" )

# Display script usage
function usage() {
    echo "Usage: $0 driver_name [modprobe_options]"
    echo
    echo "   driver_name                Driver name (ex: rtl8723de)"
    echo "   modprobe_options           Driver options (ex : \"options rtl8723de ant_sel=2\")"
    echo
    exit 1
}

# Script must be run as root
if [ "$EUID" -ne 0 ]
then
    echo "Error : please run as root"
    exit 1
fi

# Check arguments
DRIVER_NAME=$1
MOD_OPTIONS=$2
if [[ -z "$1" ]]
then
    echo "Error : missing driver name argument"
    exit 1
fi
if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]
then
    usage
fi

# Build
make install
modprobe -r ${DRIVER_NAME}
modprobe ${DRIVER_NAME}

# Modprobe options
if [[ ! -z ${MOD_OPTIONS} ]]
then
    echo "${MOD_OPTIONS}" > /etc/modprobe.d/${DRIVER_NAME}.conf  
fi

echo "FINISH"
exit 0

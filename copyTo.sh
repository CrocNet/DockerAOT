#!/bin/bash

# Optional copy executable to device
# Edit as necessary. Any arguments provided to build.sh is passed to this script, such as an IP address


OUTPUTEXE=$PROJECTPATH/$OUTPUT/$PROJECT_NAME

# If an IP address is given
for arg in "$@"; do
    # Check if the argument matches the pattern xxx.xxx.xxx.xxx
    if [[ $arg =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        IP=$arg
        break
    fi
done



if [[ -n $IP && -f $OUTPUTEXE ]]; then

     # The basic Milk-V linux build does not have full ssh/scp support, so use cat.
     cat $OUTPUTEXE | ssh root@$IP "cat > /root/$PROJECT_NAME"
     
fi

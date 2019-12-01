#!/bin/bash
sudo setenforce Permissive
sudo sh -c 'echo "vm.max_map_count = 262144" >> /etc/sysctl.conf'

sudo sh -c 'cat << EOF >> /etc/security/limits.conf
*   soft    nproc   65000
*   hard    nproc   1000000
*   -    nofile  1048576
root - memlock unlimited
EOF'

sudo sysctl -p


echo "All Done"



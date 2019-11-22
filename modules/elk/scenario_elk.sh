#!/bin/bash
sudo setenforce Permissive
sudo sh -c 'echo "vm.max_map_count = 262144" >> /etc/sysctl.conf'
sudo sysctl -p
echo "All Done"



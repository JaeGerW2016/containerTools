#!/bin/bash

mkdir -p ~/.alias
cp -r * ~/.alias/
row_nu=`grep -E "source ~/.alias/docker_aliases|source ~/.alias/kubectl_aliases" ~/.bashrc | wc -l`
if [ $row_nu -eq 2 ];then
	echo "container alias exist"
else	
cat >> ~/.bashrc <<EOF
[ -f ~/.alias/docker_aliases ] && source ~/.alias/docker_aliases
[ -f ~/.alias/kubectl_aliases ] && source ~/.alias/kubectl_aliases
EOF
fi
source ~/.bashrc

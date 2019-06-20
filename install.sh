#!/bin/bash

mkdir -p ~/.alias
cp -r * ~/.alias/
row_nu=`grep -E "source ~/.alias/docker_aliases|source ~/.alias/kubectl_aliases" ~/.bashrc | wc -l`
if [ $row_nu -eq 2 ];then
	echo "container alias exist"
else	
cat >> ~/.bashrc <<EOF
if [ -f ~/.alias/docker_aliases ]; then
	source ~/.alias/docker_aliases
fi
if [ -f ~/.alias/kubectl_aliases ]; then
 	source ~/.alias/kubectl_aliases
fi
EOF
fi
source ~/.bashrc

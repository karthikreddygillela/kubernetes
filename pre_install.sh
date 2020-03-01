#!/bin/bash

sudo apt-get update -y
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null
git clone https://github.com/kubernetes-sigs/kubespray.git


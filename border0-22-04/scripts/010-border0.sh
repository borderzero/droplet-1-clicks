#!/bin/bash
apt-get update
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.border0.com/deb/gpg | gpg --dearmor -o /etc/apt/keyrings/border0.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/border0.gpg] https://download.border0.com/deb/ stable main" > /etc/apt/sources.list.d/border0.list
apt-get -y update
apt-get -y install border0

# install bash completion
/usr/bin/border0 completion bash > /etc/bash_completion.d/border0 || true

# make our install script executable
chmod +x /sbin/border0-install.sh

# 
# Additional check for /etc/border0 directory and update /root/.bashrc
bashrcLine="if [ -f /etc/border0/border0.yaml ]; then echo -e '\nDocs and support: https://docs.border0.com/docs/getting-help\n' ; else /sbin/border0-install.sh; fi"
# Check if line already exists in /root/.bashrc to avoid duplicate entries
if ! grep -qxF -- "$bashrcLine" /root/.bashrc; then
    echo "$bashrcLine" >> /root/.bashrc
fi
#
## end of 010-border0.sh

#!/bin/bash
get () {
	curl -s $1 -o $2 || wget -q -O $2 $1
}
get https://raw.githubusercontent.com/k8-proxy/vmware-scripts/main/HealthCheck/pyCheck.py pyCheck.py
chmod +x pyCheck.py
get https://raw.githubusercontent.com/k8-proxy/vmware-scripts/main/HealthCheck/config.yml config.yml
get https://raw.githubusercontent.com/k8-proxy/vmware-scripts/main/HealthCheck/a.pdf a.pdf
sudo apt-get -y install c-icap
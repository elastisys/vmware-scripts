# Ubuntu Packer template for VMware  ESXi


## Build requirements

### Build machine
the machine running this packer template must have the following installed

- packer
- [ovftool](https://my.vmware.com/group/vmware/downloads/get-download?downloadGroup=OVFTOOL441)
- xorriso (or cdrtools)

### ESXi Host

- Minimum 60GB free storage, 4GB free RAM at the build time
- **Guest IP Hack** enabled, you can enable it by running the following on the ESXi host `esxcli system settings advanced set -o /Net/GuestIPHack -i 1`
- IP address accessible from the packer build machine (To use for the VM)


### Usage

- Run the following
```bash
git clone --single-branch -b main https://github.com/k8-proxy/vmware-scripts
cd vmware-scripts/packer/
cp vars.json.example vars.json
nano vars.json # then tweak parameters as needed, and exit
cp cdrom/user-data.example cdrom/user-data
nano cdrom/user-data # then tweak parameters indicated in commentss needed. and exit
PACKER_LOG=1 PACKER_LOG_PATH=packer.log packer build -on-error=ask -var-file=vars.json esxi.json
```
- You should be able to find the ova under output-vmware-iso
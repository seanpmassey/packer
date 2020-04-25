# v12n Packer templates (by @mpoore)
Welcome to my public repository of Packer templates used in my v12n cloud (homelab). You're very welcome to fork this repository and make your own changes. As it is, you'll have to make some edits for these packer templates to build anyway as I've removed all configuration specific to my environment from these files.

At a minimum, you'll need to edit the following files to get going:
1. var-vsphere.json - It needs details of your vSphere environment
2. centos/http/7/ks.cfg - Make any changes to how you want CentOS 7 installed here (including your root password etc)
3. centos/http/8/ks.cfg - Make any changes to how you want CentOS 8 installed here (including your root password etc)
4. centos/scripts/install-certs.sh - If you have your own certificate authority this needs updating
5. centos/scripts/install-sshkeys.sh - If you want to set any authorised keys for SSH access, update this script
6. centos/centos7-vsphere.json - Check the variables at the top, var_iso_path will certainly need changing and remove references to the two scripts above if they're not to be used
7. centos/centos8-vsphere.json - Check the variables at the top, var_iso_path will certainly need changing and remove references to the two scripts above if they're not to be used
8. windows/??/??Autounattend.xml - Each will need license keys, passwords and user information ebfore they can be used
9. windows/windows2016-vsphere.json - Check the variables at the top, var_iso_path will certainly need changing
10. windows/windows2019-vsphere.json - Check the variables at the top, var_iso_path will certainly need changing
11. windows/scripts/??/phase2-config.ps1 - Check the variables at the top for the certificate authority and BGinfo location

For the windows builds, you'll need to download packer-provisoner-windows-update from https://github.com/rgl/packer-provisioner-windows-update and make sure its somewhere where packer can find it.

For usage, set you shell location to the packer directory and run one of the following:
packer build -var-file=var-vsphere.json centos/centos7-vsphere.json
packer build -var-file=var-vsphere.json centos/centos8-vsphere.json
packer build -var-file=var-vsphere.json windows/2016/windows2016-vsphere.json
packer build -var-file=var-vsphere.json windows/2019/windows2019-vsphere.json

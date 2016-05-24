#### Packer
The packer configuration consists of three parts:
  
1. The packer json file `debian-8-amd64.json`
2. The `preseed.cfg` file (in `http/debian-8-amd64`) used to instruct the debian installer (see [here](https://wiki.debian.org/DebianInstaller/Preseed) for more info)
3. Post-install scripts in `scripts/` which are executed in the order defined in the `debian-8-amd64.json` file (under `provisioners -> scripts`)

Start the build process:

```
packer build debian-8-amd64.json
```

Packer will download the Debian ISO image as well as the VirtualBox Guest Additions and then launch a VirtualBox VM to perform the installation in.
The installation is not headless, so you will see a window where all the commands are executed. This entire process requires no user input.
After the installation is complete, the VM will restart and packer will run the post-install scripts.

Once packer reports `"Build 'virtualbox-iso' finished."` you'll find a the ready to use vagrant box at `build/debian-8-amd64.box`.

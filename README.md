# VirtualboxWSL2

A plugin for Vagrant that fixes `vagrant up` and `vagrant ssh` when executed from WSL2.

Two things happen on top of normal Vagrant behavior:
- the second port forwarding entry is created on 0.0.0.0 that allows to ssh to VirtualBox VM from WSL2 on Windows IP.
- Windows IP is automatically selected for `vagrant ssh` command instead of localhost.

## Installation

```
vagrant plugin install virtualbox_WSL2
```

## Usage

Nothing special, just use standard `vagrant up` and `vagrant ssh` commands.

## Prerequisites
Set following sample env variable appropriately
```
VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH=/mnt/c/VAGRANT_PROJECTS/UREG/ureg-dlt-poc
```
```
VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1
```

Refer to https://www.vagrantup.com/docs/other/wsl for more

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/karandash8/virtualbox_WSL2.

## Check
Please refer to script.ps1 to enable dns permissions

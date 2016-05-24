### Debian 8.x VirtualBox image for Vagrant

Debian 8.x [Packer](https://packer.io) template that creates a [Vagrant](https://vagrantup.com) base box for [VirtualBox](https://www.virtualbox.org).
It is created according to the vagrant [base box guidelines](https://www.vagrantup.com/docs/boxes/base.html).

The final build can be downloaded from Atlas: [fyndiq/jessie64](https://atlas.hashicorp.com/fyndiq/boxes/jessie64/)

#### Usage
To use the box, just run:

    vagrant init fyndiq/jessie64
    vagrant up

#### Building the box
To build the box yourself, you'll need to have the following installed:

* [VirtualBox](https://www.virtualbox.org/) 5.0
* [Vagrant](https://www.vagrantup.com/) 1.9
* [Packer](https://packer.io/) 0.10

Then you can start start the build with:

    make

See the [README in the packer directory](packer/README.md) for more detailed information about the build process.

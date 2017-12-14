# ACME Vagrant Environment

## Requirements

In order to use this repository you need the following:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)
- [Puppet](http://docs.puppetlabs.com/guides/installation.html)

## Using ACME Vagrant Environment

This repo was developed to be copied and re-used as needed in other projects. It
is only meant to make per project golang environments easier to manage. I have
tried other golang modules for puppet and they didn't work as expected.

Clone or copy the repo and do the following:

    $ cd /path/to/repo
    $ vagrant up
    $ vagrant ssh
    # ...test go
    $ go version
    $ go install hello
    $ hello

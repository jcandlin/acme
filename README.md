# ACME Vagrant Environment

## Requirements

In order to use this repository you need the following:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)
- [Puppet](http://docs.puppetlabs.com/guides/installation.html)

## Using ACME Vagrant Environment

Clone or copy the repo and do the following:

    $ cd /path/to/repo
    $ vagrant up
    $ vagrant status
    $ vagrant ssh lb01 - to view nginx VM
    $ vagrant ssh app01 - to view go app server VM
    $ vagrant ssh app02 - to view go app server VM
    # ...test go
    $ go version
    $ go install hello
    $ hello

    $ http://10.11.12.50:8080 - to go via the load balancer (round robin) to the app

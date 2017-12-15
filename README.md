# ACME Vagrant Environment

## Requirements

In order to use this repository you need the following:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)
- [Puppet](http://docs.puppetlabs.com/guides/installation.html)

## Using ACME Vagrant Environment

Clone or copy the repo and do the following:

    $ cd /path/to/repo
    $ vagrant up lb01 - nginx load balancer
    $ vagrant up app01 - go application server
    $ vagrant up app02 - go application server
    $ vagrant status
    $ vagrant ssh lb01 - to view nginx VM
    $ vagrant ssh app01 - cd /vagrant/src/app; go run app.go
    $ vagrant ssh app02 - cd /vagrant/src/app; go run app.go

    $ http://10.11.12.50:80 - to go via the load balancer (round robin) to the apps
 
## Testing the load-balancer

    $ on the app01 server stop the go app
    $ http://10.11.12.50:80 - is the application still available?
    $ on the app02 server stop the go app
    $ http://10.11.12.50:80 - is the application still available?  
    $ check the /var/log/nginx/access.log - 10.11.12.1 - - [15/Dec/2017:17:14:15 +0000] "GET /favicon.ico HTTP/1.1" 502 583 "http://10.11.12.50/" indicates no apps are running  
    $ restart the go app on app02
    $ check the /var/log/nginx/access.log - 10.11.12.1 - - [15/Dec/2017:17:16:38 +0000] "GET /favicon.ico HTTP/1.1" 200 36 "http://10.11.12.50/" indicates the app is being server from app02
    $ restart the go app on app01
    $ http://10.11.12.50:80 - 10.11.12.1 - - [15/Dec/2017:17:18:27 +0000] "GET /favicon.ico HTTP/1.1" 200 36 "http://10.11.12.50/" indicates that the app is being served from app01 again



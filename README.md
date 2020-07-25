# OSX LAMP Manager
Replacement for AMPPS and XAMPS for OSX using Brew, shell scripts and python programs

## Introduction
I got tired of AMMPS and XAMPS never updating their binaries for OSX so decided to
try and manage it all using stuff that is easily available on OSX.

This is very much a work in progress. I started writing it after I had installed most
of the things I needed. So I'm writing things as I need them. If you want anything to
jump the queue then I'm always open to a Pull Request!

## Aimed at
This is aimed at developers working on their Macbook Pros. It's not meant to run in
production. Default settings tend towards open and less secure, leaving you free to
spend time finding out how to lock it down if you want, rather than wasting time
figuring out how to open it up!

## Setup
1. Setup install brew.
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
2. Use brew to install the things you need:
```
brew install httpd
brew install mariadb
brew install php
brew install mongodb-community
brew install mysql@5.7
```
## Run
Open a terminal window and type:
```
./osx-lamp-manager
```

## User documentation
```
MAIN
----

1. Httpd Virtual Hosts
2. Brew Managment
3. Services

q. quit

Choose? 1
```
Select *Httpd Virtual Hosts*
```
HTTPD Virtual Hosts
-------------------

1. www.example1.com
2. www.example2.com
3. www.example3.com

-------------------
  501 31169     1   0  3:36pm ??         0:01.04 /usr/local/opt/httpd/bin/httpd -D FOREGROUND
and 5 workers

1. Add
2. Edit
3. Delete
4. Load
5. Save
6. Restart
7. Tail logs

x. Back

Choose? 1
Host name [example.com]? 
Port number [8080]? 
Server admin [webmaster@example.com]? 
Document root [/usr/local/var/www/example.com]? 
PHP Version [7.4]? 
PHP Version lib [libphp7.so]? 
PHP Version module [php7_module]? 
Error log [/usr/local/var/log/httpd/example.com-error_log]? 
Custom log [/usr/local/var/log/httpd/example.com-access_log]?
```
Select *Load* to load current vhost configuration. This splits the current `httpd-vhosts.conf`
into `vhost.1`, etc. You can edit, add and delete these. *Save* will create a new `httpd-vhosts.conf`.
The `/etc/hosts` file will be updated and the skeleton root document copied in.
You can restart if needed or tail the logs if there is a problem.

NOTE: Keep the `VirtualHost` tags on the first and last line of the `vhost.n`.

Options prefixed with a "-" are placeholders and have not been implemented.

In the menu section, answering "q" will exit the application.
In a sub-program you can `^c` to break out.
Unfortunately, the border between menu and sub-program is in flux as the application grows - sorry!


## Mission statement
```
[x] I want to be able to manage virtual hosts
[ ] I want to switch/separate mysql and mariadb
[ ] I want to manage php versions across virtual hosts
[-] I want to manage LAMP applications under brew control
[ ] I want to support other non-traditional LAMP applications e.g. node
[ ] I want to manage MySQL/MariaDB users
```

## Developers
* When submitting when beginning a new feature please branch from `master`.
* When submitting an Pull Request, please rebase before submitting.


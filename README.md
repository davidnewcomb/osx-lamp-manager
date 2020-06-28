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
> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
2. Use brew to install the things you need:
> brew install httpd
> brew install mariadb
> brew install php
> brew install mysql@5.7

## Run
Open a terminal window and type:
> ./osx-lamp-manager

## Mission statement
[x] I want to be able to manage virtual hosts
[ ] I want to switch/separate mysql and mariadb
[ ] I want to manage php versions across virtual hosts
[-] I want to manage LAMP applications under brew control
[ ] I want to support other non-traditional LAMP applications e.g. node
[ ] I want to manage MySQL/MariaDB users


Simple shell script to deploy with ssh, git and shell script on a web server.
This deployment technique separates your web server from your remote git, it offers additional security, as well as increased scalability. Moreover, this process will be the same regardless of the server.

---

## Requirement

* Github or GitLab repository
* Web server (Apache or Ngnix)
* Ability to use SSH on your server

---

## Configuration

For the exemple we are going to take a simple repo on github : **simple_test_repo**.
*Don't forget to configure your gitignore file for ignore configuration (environnement, database) file for example.*

* First, connect to you server with ssh : 
```shell
ssh user@000.00.000.000 -p 00
```
* Go in the *srv* directory : 
```shell
cd /srv
```
* Create a *src* directory  : 
```shell
sudo mkdir src
```
* Give permission to the user  : 
```shell
sudo chown user:user src
```
* Go into the *src* directory : 
```shell
cd src
```
* Clone your Github répo (you can use ssh clone if you have configurate ssh keys) : 
```shell
git clone https://github.com/user/simple_test_repo.git
``` 

* Check if the clone work well : 
```shell
ls
```
* Create a *scripts* directory and go in : 
```shell
sudo mkdir scripts
&&
cd scripts
```
* Create a *sh* script : 
```shell
nano pull_and_deploy_website.sh
```
* Past this in and custumize it for your path :
```shell
!#/bin/bash
cd /srv/src/simple_test_repo
git pull
rsync -r . /var/www/html --exclude .git
```

* Give permission to the script : 
```shell
chmod +x pull_and_deploy_website.sh
```
You have finished with the basic configuration, you can of course adapt all this to your needs. For a first deployment it is strongly recommended to add your configuration files only in *var/html/www* and not in *src*.

---

## Usage

* Excecute : 
```shell
srv/src/scripts/pull_and_deploy_website.sh
```
This will execute your script and all the commands found there, in the event of an error it will display the error of the command in question. During the process (git pull) it will ask you for your Github or Gitlab credentials, to avoid this, use an ssh key. 

---

## Customization

You can of course customize this script by adding any configuration, build or test command, you can very well integrate this script into a pipeline for a simple and secure CD.

It is even advisable to separate this script into three parts : 

The first one for the git pull : 

```shell
!#/bin/bash
cd /srv/src/simple_test_repo
git pull
```

A second one for copying : 

```shell
!#/bin/bash
cd /srv/src/simple_test_repo
rsync -r . /var/www/html --exclude .git
```
And a third to execute the two previous ones : 

```shell
!#/bin/bash
/srv/src/scripts/pull_website.sh
/srv/src/scripts/deploy_website.sh

```

It depends only on you how you want to scale your deployment :octocat:

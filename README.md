# Deploy Shell Script  :rocket:
Simple shell script to deploy with git on a ubuntu web server.
This deployment technique separates your web server from your remote git, it offers additional security, as well as increased scalability. Moreover, this process will be the same regardless of the server.

## Requirement

* Github or GitLab
* Web server [Linux]
* Ability to use SSH

## Configuration

For the exemple we are going to take a simple repo on github : **simple_test_repo**.

*Don't forget to configure your gitignore file for ignore configuration (environnement, database) file for example*

* First, connect to you server with ssh : ```ssh user@000.00.000.000 -p 0000```
* Go in the *srv* directory : ```cd /srv```
* Create a *src* directory  : ```sudo mkdir src```
* Give permission to the user  : ```sudo chown user:user src```
* Go into the *src* directory : ```cd src```
* Clone your Github répo : ```https://github.com/user/csimple_test_repo.git``` (you can use ssh clone if you have configurate ssh keys
* Check if the clone work well : ```ls```
* Create a *scripts* directory and on in : ```sudo mkdir scripts``` & ```cd scripts```
* Create a *sh* script : ```nano pull_and_deploy_website.sh```

```shell
!#/bin/bash
cd /srv/src/simple_test_repo
git pull
rsync -r . /var/www/html --exclude .git
```

* Give permission to the script : ```chmod +x pull_and_deploy_website.sh```
* Create your new environnement file for your projet only in ```/var/www/html/```

## Usage

* Excecute : ```srv/src/scripts/pull_and_deploy_website.sh``` at ```~$```

## Customization

You can of course customize this script by adding for example ```compose install``` or ```compose update```, you can very well add a series of unit tests and integrate this script into CI/CD.

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


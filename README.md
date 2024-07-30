# README @ grzechowski/dockerization

Quick [local development tools based on bash, docker and docker-compose](https://github.com/grzechowski/dockerization)

## Quick steps

Requires docker and docker-compose.

This tool can be refactorized so to move some Dockerfiles into repository and allow further integration of docker into devops environment, this is for local development of more complex microservice architectures with one place of organization in mind and organized configuration framework plus easy usage for non-docker users;

### First run

If you have your projects downloaded into:

 * /home/me/workspace/dockerizationportal
 * /home/me/workspace/symfonyportal

```
 $ cd /home/me/workspace/dockerizationportal
 $ ./console.sh link php5.6 /home/me/workspace/symfonyportal
 $ ./console.sh b php5.6
 $ ./console.sh b mail
 $ ./console.sh u mail
 $ ./console.sh u php5.6
```

now just copy contents of this into your /etc/hosts

```
$ cat /home/me/workspace/dockerizationportal/dockers/dev/hostnames-dockers
```

once you copied hosts, you can check

 * http://portal.mindseyesociety.dock/
 * http://mail.mindseyesociety.dock

 in Your browser

### Daily usage

Up 

```
 $ ./console.sh u mail,php5.6
```

Down

```
 $ ./console.sh d mail,php5.6
```

## Docker toolkit installation/update

## Base usage

  ```
  $ ./console.sh
  ```

  and it should be more or less self-explanatory. Some examples are available with

  ```
  $ ./console.sh examples
  ```

## Latest set of projects configured in dockerization

  ```
  $ ./console.sh l

  List of available projects:

          dev/mail
    [b]   dev/project

    [b] - project build use settings

  ```

build settings are located in dockers/[env-name]/[project-name]/docker/.settings
default build settings are located in dockers/[env-name]/[project-name]/docker/.settings-default

## Setting up dev/ projects

First you need to configure dev/ projects hosts on your local Linux host.

 ```
 $ sudo su -
 # cat dockers/dev/hostnames-dockers >> /etc/hosts
 # exit
 ```

Please check if you do not have a local network conflict in regards to IP range

## Linking and build

projects may require your local git code repository as these setups are for project developers

```
$ ./console.sh l

List of available projects:

        dev/mail
  [b]   dev/project

  [b] - project build use settings

$ ./console link project PATH-TO-PROJECT-CODE-REPO
$ ./console b,u mail,project

```

An example for project linking with repo and building and upping (b,u) of all elements (mail,project)

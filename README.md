# README @ dockerizationportal

Quick [local development tools based on Bash, Docker, and Docker Compose](https://github.com/grzechowski/dockerization).

---

## 🚀 First Steps

### Cloning some projects

Requires git and access to these projects in github plus your local terminal git/ssh/github configuration.

```bash
cd ~
mkdir workspace
cd workspace
mkdir enigma
cd enigma
for i in dockerizationportal symfonyportal cdb-ui cdb-api; do git clone git@github.com:MindsEyeSociety/$i.git; done
ls -l 
cd dockerizationportal
```

### Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed  
- [Docker Compose](https://docs.docker.com/compose/install/) installed

Your installation procedure may differ depending on OS.

### Network Setup
- Add the configuration lines from [./dockers/dev/hostnames-dockers](./dockers/dev/hostnames-dockers) to your system’s `hosts` file.  
- Ensure you are using the **latest version** of these configuration lines.

```bash
sudo su -
echo >> /etc/hosts
cat ./dockers/dev/hostnames-dockers >> /etc/hosts
exit
```

---

## ⚙️ Usage

To open the project console, run:

```bash
./console.sh
```

If the console starts without errors, your dependencies are properly installed and configured.

---

## 📨 Example: Mailcatcher

### Build the Mailcatcher container
```bash
./console.sh b mail
```

If errors occur, it may indicate that some base libraries have changed and the Dockerfile needs updating. For support, you can [contact @yodahack](https://github.com/yodahack).

### Start the Mailcatcher container
```bash
./console.sh u mail
```

### Verify the container is running
```bash
docker ps | grep mes_
docker ps
```

### Access the Mailcatcher interface
Once running, open your browser at:  
👉 [http://mail.mindseyesociety.dock/](http://mail.mindseyesociety.dock/)  

Mailcatcher can be used with your other Dockerized applications to capture outgoing emails in a safe development environment.

---

## 📦 Example: Symfonyportal

This is configuration for [Symfonyportal project](https://github.com/MindsEyeSociety/symfonyportal).

### Link with repo

```bash
./console.sh link symfonyportal PATH-TO-REPO-CLONE-Symfonyportal
```

### Build the Symfonyportal container
```bash
./console.sh b symfonyportal
```

### Up the Symfonyportal container
```bash
./console.sh u symfonyportal
```

### Verify the container is running
```bash
docker ps | grep mes_
docker ps
```

### Acess to Symfonyportal database

You need local mysql client this is CLI client example

```
mysql -uroot -pmesportal -hnew.db.mindseyesociety.dock mesportal
```

### Access the Symfonyportal interface
Once running, open your browser at:  
👉 [http://new.portal.mindseyesociety.dock/](http://new.portal.mindseyesociety.dock/) 

---

## 🛠 Notes
- Always keep your Docker images up to date.  
- Rebuild containers when base images or libraries change. ``./console.sh r PROJECT-NAME``
- Ensure your `hosts` file matches the latest provided configuration.
- It is good idea to always put down containers or stop them when you are turning off your workstation ``./console.sh d mail,op``
- Once You have build multiple projects you can just up them together ``./console.sh u mail,op``
- If you want to keep live changes in instances ``./console.sh stop mail,op`` ``./console.sh start mail,op``

---

---

## 📦 Example: CDB

This is configuration for **cdb** stack (UI + API).

### Link with repos

```bash
./console.sh link cdb PATH-TO-REPO-CLONE-cdb-api 1
./console.sh link cdb PATH-TO-REPO-CLONE-cdb-ui 2
```

### Build the CDB containers
```bash
./console.sh b cdb
```

### Up the CDB containers
```bash
./console.sh u cdb
```

### Verify the containers are running
```bash
docker ps | grep mes_
docker ps
```

### Start dev serving processes for both components

Component API on Terminal Tab

```bash
docker exec -it mes_cdb_api_1 /bin/bash
npm run dev
```

Comonent UI on Terminal Tab

```bash
docker exec -it mes_cdb_web_1 /bin/bash
npm run start
```

### Acess to CDB database

You need local mysql client this is CLI client example

```
mysql -uroot -pcdb -hdb.cdb.mindseyesociety.dock cdb
```

### Access the CDB interfaces
Once running, open your browser at:  
👉 http://cdb.mindseyesociety.dock/  
👉 http://api.cdb.mindseyesociety.dock/

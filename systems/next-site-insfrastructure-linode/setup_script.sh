#!/bin/bash

#Check if the system is up-to-date.
apt-get update
#Install Docker.
apt install docker.io -y
#Install all the dependency packages.
snap install docker
#Clone repo inside VM
git clone https://artibhoir369:glpat-jiwXCPszrVcxqVeG2Jem@gitlab.com/advocatediablo/ejs.git
#docker login
docker login -u artibhoir369 -p dckr_pat_GN5LxgN6RoSOHDf67_qzrewkZ8g
#docker pull
docker pull artibhoir369/nextresearch:latest
#Run conainer
docker run --name nextresearch -p 80:80 -v /root/ejs/app/www/ver4:/usr/share/nginx/html -v /root/ejs/app/confluence-report/download:/usr/share/nginx/html/docs -d artibhoir369/nextresearch
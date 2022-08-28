#!/bin/bash

#OLUWANIFEMI OLUWAGBEMILA

#UPDATE UBUNTU LINUX MACHINE V20.04
echo Updating Machine.........
sudo apt-get update
sleep 4
echo
echo
echo

#INSTALL DOCKER ON UBUNTU V20.04
echo Installing docker on UBuntu Machine.........
sudo apt-get install -y docker.io
sleep 4
echo
echo
echo

#INSTALL JENKINS 
#Install all dependencies for jenkins
echo Installing all dependencies needed for jenkins to run...........
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk
sleep 4
echo
echo
echo
#Install jenkins package

echo Installing Jenkins ........

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins
sleep 4
echo
echo
echo
#STARTING  UP JENKINS PACKAGE
echo All task COMPLETED!!!!
echo
echo Jenkins Package should be starting in a sec...
sleep 3
echo Jenkins Package is getting started....
sudo systemctl start jenkins
echo
echo
echo


#ADD JENKINS TO DOCKER GROUP - SO THAT JENKINS CAN HAVE ACCESS TO USE DOCKER
echo Jenkins user added to docker group
sudo usermod -aG docker jenkins


echo JOB SUCCESSFULLY COMPLETED!!!!!
echo BYE





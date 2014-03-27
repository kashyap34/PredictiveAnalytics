#!/bin/sh
#
#This script is used to deploy the project
#

PATH_MAVEN='/home/kashyap/Documents/CmpE295B/MavenProject/PopulationAnalytics'
PATH_WAR='/home/kashyap/Documents/CmpE295B/MavenProject/PopulationAnalytics/target'
PATH_WEBAPPS='/home/kashyap/Documents/CmpE295B/Tomcat7/apache-tomcat-7.0.52/webapps/'
PATH_TOMCAT='/home/kashyap/Documents/CmpE295B/Tomcat7/apache-tomcat-7.0.52/bin'
PATH_LOGS='/home/kashyap/Documents/CmpE295B/MavenProject/PopulationAnalytics/src/main/logs'

#give permissions to the folder for writing and executing
sudo chmod 777 -R *

#delete the previous versions of war file to ensure proper deployment
cd ${PATH_WAR}
echo "Removing previous versions of war file"
rm -r *

#delete previous log files temporarily to make sure the logs are for current execution
#TO-DO: comment this while preparing for final deployment
cd ${PATH_LOGS}
echo "Clearing the logs"
rm -r *

#change directory to the pom.xml directory in case you are in different location
cd ${PATH_MAVEN}

#run maven clean package
echo "Running maven clean package..........."
mvn clean package

#copy the newly generated war to the tomcat webapps directory for deployment
echo "preparing for deployment.........."
cp ${PATH_WAR}/PopulationAnalytics.war ${PATH_WEBAPPS}

#change the directory to tomcat installation directory
cd ${PATH_TOMCAT}

#echo "Shutting down tomcat......"
#sudo sh shutdown.sh

echo "Starting tomcat........."
sudo sh startup.sh 

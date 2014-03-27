#!/bin/sh
#
#This script is used to generate the dump for the Patient's data in mongo
#

PATH_MONGO='/home/kashyap/Softwares/mongodb-linux-x86_64-2.4.8/bin/'

cd ${PATH_MONGO}

./mongodump --collection Diabetes --db Patient

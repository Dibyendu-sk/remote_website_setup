#!/bin/bash

# defining variables
TEMP_DIR=/tmp/webfiles
WEBtEMPLATE_lINK="https://www.tooplate.com/zip-templates/2108_dashboard.zip"
ZIP_FILE="2108_dashboard.zip"
TEMPLATE_FOLDER="2108_dashboard"

yum --help > /dev/null
if [ $? -eq 0 ]
then
        echo " ###################################### Running setup for centOS 7 ############################################"
        echo
        PACKAGE="httpd wget unzip"
        SERVICE="httpd"

        echo "--------------------------- Installing Packages ----------------------------"
        sudo yum install $PACKAGE -y > /dev/null

        mkdir -p TEMP_DIR
        cd TEMP_DIR

        echo "[ --------------------------- Downloading website files --------------------------- ]"
        sudo wget $WEBtEMPLATE_lINK #website template
        sudo unzip -o $ZIP_FILE > /dev/null # -o is for override if the file already exists.
        echo
        echo "[ --------------------------- copying website files --------------------------- ]"
        sudo cp -r $TEMPLATE_FOLDER/* /var/www/html/
        echo
        echo "[ --------------------------- Cleaning up the temporary files --------------------------- ]"
        sudo rm -rf $TEMP_DIR
        echo
        echo "[ --------------------------- Restarting the $SERVICE service --------------------------- ]"
        sudo systemctl restart $SERVICE

else
        echo " ###################################### Running setup for Ubuntu ############################################"
        echo
        PACKAGE="apache2 wget unzip"
        SERVICE="apache2"

        echo "--------------------------- Installing Packages ----------------------------"
        sudo apt install $PACKAGE -y > /dev/null

        mkdir -p TEMP_DIR
        cd TEMP_DIR

        echo "[ --------------------------- Downloading website files --------------------------- ]"
        sudo wget $WEBtEMPLATE_lINK #website template
        sudo unzip -o $ZIP_FILE > /dev/null # -o is for override if the file already exists.
        echo
        echo "[ --------------------------- copying website files --------------------------- ]"
        sudo cp -r $TEMPLATE_FOLDER/* /var/www/html/
        echo
        echo "[ --------------------------- Cleaning up the temporary files --------------------------- ]"
        sudo rm -rf $TEMP_DIR
        echo
        echo "[ --------------------------- Restarting the $SERVICE service --------------------------- ]"
        sudo systemctl restart $SERVICE

fi

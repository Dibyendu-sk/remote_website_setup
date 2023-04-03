# remote_website_setup

## Automating remote website setup by using shell scripting and vagrant
### in this with help of shell script we can automate the whole task of changing the website template of the default HTTPD OR APACHE2.
#### Here we have 3 machines web01(CentOS7) , web02(CentOS7) , web03(Ubuntu). Now we can change the web template of the machines through another machine named scriptbox which is based on CentOS7.

## Steps
- To do this project we created a user called **dibx** in the all of the 3 machines.
  - we have to grant all privilege to the user **dibx**. So we have to edit the **visudo** file to give all access to the user. 
- To connect to the machine with hostname rather than using the ip-address , we have to edit the /etc/hosts file.

- All of the 3 machines connected to the scriptbox machine via SSH client where the username of the machines is "dibx".
  - [root@scriptbox ~]# ssh-keygen
  - [root@scriptbox ~]# ssh-copy-id dibx@web01 && ssh-copy-id dibx@web02 && ssh-copy-id dibx@web03
- Here we have 2 script
  - ***multiOs_setup.sh*** : This is the main script which does all of the work.
  - ***remote_execution.sh*** : This is the script through which the **scriptbox** machine will be connected to other three machines **web01 , web02 and web03** and via this the 1st script will export to the machines and will be executed inside the machines.

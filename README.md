This repo contains docker scripts and todos to setup Jenkins, Sonarqube and Postgres.

# Advantages
* Hasslefree deployment on any server.
* Automated plugins installation for Jenkins. You can configure the list of plugins in Plugins.txt file.

# Installation steps
* Download the zipped folder and place it at a desired location.
* Navigate to the unzipped folder and run ```$ docker-compose up --build```
* Once docker containers are up, you should be able to reach jenkins on ```http://localhost:8080``` and Sonarqube on ```http://localhost:9000```

# Launching Jenkins
* Hit ```http://localhost:8080```
* Copy initial password from ```<cicd_setup_folder>/Jenkins/secrets/initialAdminPassword```
* When prompeted to install plugins, close by clicking 'X' at top right corner of the form.
* Change password for admin user by clicking on 'Admin' and then 'configure'.

# Configure Jenkins agent
Inorder to build and analyse projects, you need to run an agent on macos (for iOS, macOS projects). Below are the steps to configure agent on Jenkins server running on a docker container.

* Run ```$ docker container ls``` in terminal
* Grab container id for Jenkins container, one running on PORT 8080
* Run ```$ docker container exec -u 0 -it <container_id> /bin/bash```. This should open up container's bash ```root@<container_id>:/#```
* Run ```$ ssh <mac_username>@<mac_ip_address>```. Enter password and type yes when prompted to save the host.
* Type ```$ exit```. This should bring you back to mac machine's terminal.
* Open Jekins server ```http://localhost:8080```
* Navigate to 'Manage Jenkins' ==> 'Manage nodes and clouds'
* Click 'New Node'
* Enter a node name, select 'Permanent Agent' and click Ok
* Enter path to Jenkins folder in 'Remote root directory'. Path should be ```/<path_to_unzipped_folder>/Jenkins```
* Select 'Launch agents via SSH' in 'Launch method'
* Enter mac machine's IP address in host. You can get it from 'Network Utility' 
* Add credentials (username, password) by clicking on 'add' adjacent to 'Credentials' dropdown.
* Select 'Manually trusted key verification strategy' in 'Host key verification strategy' and save the configuration.
* Click on 'Relaunch agent'. You should see successful connection.


CONGRATULAITONS! YOU ARE ALL SETUP TO BUILD AND ANALYSE YOUR PROJECTS.

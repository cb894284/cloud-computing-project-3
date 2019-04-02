set -x
sudo apt -y update

#setup apache
sudo apt install -y apache2
sudo ufw allow in "Apache Full"
sudo systemctl enable apache2

#My-SQL
sudo apt install mysql-server
sudo ufw allow mysql
#PHP
sudo apt install phpmyadmin php-mbstring php-gettext
sudo systemctl restart apache2

# allow ports
setup ufw allow 8888
setup ufw allow 22

#copy the website soure to the correct directory 
#this was commented out since it was not registering properly with apache
  #sudo \cp -Rf /local/repository/Web_Setup/www /var/
  #sudo \cp -Rf /local/repository/Web_Setup/apache2 /etc/
  #sudo \cp -Rf /local/repository/Web_Setup/php /etc/
  #sudo \cp -Rf /local/repository/Web_Setup/phpmyadmin /etc/
  #sudo \cp -Rf /local/repository/Web_Setup/mysql /etc/
  #sudo systemctl restart apache2


# create a user named seed with password dees. 
sudo useradd -m -p WchOyJRR.1Qrc -s /bin/bash seed
sudo usermod -p $1$WchOyJRR$8RusOKWnvIwQofuLA.eUG. root

sudo usermod -aG sudo seed
sudo usermod -aG root seed
sudo su seed -c "touch ~/.sudo_as_admin_successful"
sudo su seed -c "cd ~/ && unset XDG_RUNTIME_DIR && nohup jupyter notebook --NotebookApp.token='' --ip * --no-browser > ~/nohup_jupyter.out &"


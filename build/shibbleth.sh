# install JDK
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get -y install openjdk-7-jre-headless

sudo apt-get -y install openjdk-8-jre-headless
# install tomcat
wget -O 'installers/tomcat7.tar.gz' 'http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.73/bin/apache-tomcat-7.0.73.tar.gz'
tar -xzf installers/tomcat7.tar.gz  -C server/tomcat/ --strip-components=1
# install Shibboleth
wget -O 'installers/shibidp2.4.tar.gz' 'http://shibboleth.net/downloads/identity-provider/2.4.0/shibboleth-identityprovider-2.4.0-bin.tar.gz'
tar -xzf installers/shibidp2.4.tar.gz -C installers/shibidp --strip-components=1
# Config environment
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/" >> ~/.bashrc
source ~/.bashrc
# install Shibboleth
cd installers/shibidp; ./install.sh && cd -

sudo ./startup.sh;
sudo tail -f /home/ubuntu/server/tomcat/logs/catalina.out


#Check TCP running services
sudo netstat -plnt

#Kill by program name
sudo pkill java
sudo pkill sldap

#Restart OpenLDAP service
sudo systemctl restart slapd.service

#this scripted file written for jenkins in centos 9
sudo dnf update -y
yum install wget curl -y
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.rpm
sudo rpm -ivh jdk-21_linux-x64_bin.rpm
echo "export JAVA_HOME=/usr/java/jdk-21" >> /etc/profile
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile
source /etc/profile
echo $JAVA_HOME
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload

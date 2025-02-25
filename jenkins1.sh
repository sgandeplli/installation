#Update the system
# script for Debian 
sudo apt update -y
sudo apt upgrade -y

# Install required packages (wget and curl)
sudo apt install wget curl -y

# Download Java 21 RPM package and install dependencies
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.rpm

# Install Java 21 using dpkg
sudo apt install alien -y
sudo alien --to-deb jdk-21_linux-x64_bin.rpm

# Install the converted .deb package
sudo dpkg -i jdk-21_*.deb

# Set JAVA_HOME and update PATH
echo "export JAVA_HOME=/usr/java/jdk-21" | sudo tee -a /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee -a /etc/profile

# Reload the profile for the changes to take effect
source /etc/profile

# Verify Java installation
echo $JAVA_HOME
java -version

# Add the Jenkins repository
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins.asc
echo "deb [signed-by=/usr/share/keyrings/jenkins.asc] https://pkg.jenkins.io/debian/ stable main" | sudo tee /etc/apt/sources.list.d/jenkins.list

# Update package list and install Jenkins
sudo apt update -y
sudo apt install jenkins -y

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check Jenkins status
sudo systemctl status jenkins

# Allow Jenkins port through firewall
sudo ufw allow 8080/tcp
sudo ufw reload

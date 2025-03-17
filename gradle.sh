wget https://services.gradle.org/distributions/gradle-8.4-bin.zip -P /tmp
sudo mkdir /opt/gradle
sudo unzip /tmp/gradle-8.4-bin.zip -d /opt/gradle
echo 'export GRADLE_HOME=/opt/gradle/gradle-8.4' | sudo tee /etc/profile.d/gradle.sh
echo 'export PATH=$GRADLE_HOME/bin:$PATH' | sudo tee -a /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh
gradle -v

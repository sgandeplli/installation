curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
docker --version
systemctl enable docker
systemctl start docker 
systemctl status docker

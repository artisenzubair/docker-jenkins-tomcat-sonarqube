#/bin/bash

# Install Docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Run Jenkins container with LTS version
sudo docker run -d --name jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

# Run SonarQube container
sudo docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

# Run Tomcat container
sudo docker run -d --name tomcat -p 9090:8080 tomcat

# Display URLs
jenkins_url="http://localhost:8080"
sonarqube_url="http://localhost:9000"
tomcat_url="http://localhost:9090"

echo "Jenkins is accessible at: $jenkins_url"
echo "SonarQube is accessible at: $sonarqube_url"
echo "Tomcat is accessible at: $tomcat_url"

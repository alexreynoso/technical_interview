#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
sudo apt -y update
sudo apt -y install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt -y install net-tools
# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
#wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
#sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -y install ca-certificates
sudo apt -y update
sudo apt -y install openjdk-8-jdk
sudo apt -y install jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo ufw allow 8080
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
  sleep 1
done
sudo cat /var/lib/jenkins/secrets/initialAdminPassword >> /home/ubuntu/jenkins.key
sudo cat > /home/ubuntu/script.sh << "EOF"
#!/bin/bash
COUNTER=0
mkdir /dev/shm/test
while true
do
	inode=$(df -i | grep -i "/dev/shm" | awk '{print $4}')
	if [ $inode == 0 ]
	then
		exit 0
	else
		mkdir /dev/shm/test/$COUNTER
 		COUNTER=$[$COUNTER +1]
	fi
done
EOF

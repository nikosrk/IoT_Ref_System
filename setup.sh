# Change to root
sudo su
# Update && Upgrade
apt update && apt upgrade

# Install the MongoDB 4.4 GPG key:
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Add the source location for the MongoDB packages:
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Download the package details for the MongoDB packages:
apt-get update

# Install MongoDB:
apt-get install -y mongodb-org

# Ensure mongod config is picked up:
sudo systemctl daemon-reload

# Tell systemd to run mongod on reboot:
sudo systemctl enable mongod

# Start up mongod!
sudo systemctl start mongod

# Installing Mosquitto Broker
sudo apt update && apt upgrade
sudo apt install -y mosquitto mosquitto-clients

# Enable remote access for IoT devices communication
echo "listener 1883" >> /etc/mosquitto/mosquitto.conf
echo "allow_anonymous true" >> /etc/mosquitto/mosquitto.conf

# Tell systemd to run Mosquitto
sudo systemctl enable mosquitto.service

# Install Node.js
sudo apt install nodejs
# Install Node.js Package Manager
sudo apt install npm

# Install MQTT.js client library 
npm install mqtt --save

# Install Mongoose 
npm install mongoose --save
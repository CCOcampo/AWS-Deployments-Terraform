#Install node version manager
sudo su -
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

#Activate nvm
#Carga NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#Use nvm to install the latest version of Node.js
nvm install node

#To install git
sudo yum update -y
sudo yum install git -y

#Run below command to clone the code repository from Github
git clone https://github.com/aljoveza/devops-rampup.git

#Ir al directorio del frontend
cd devops-rampup/movie-analyst-api

#Install the dependencies
npm install
nohup bash -c 'export NODE_ENV=dev && node server.js' > output.log 2>&1 &
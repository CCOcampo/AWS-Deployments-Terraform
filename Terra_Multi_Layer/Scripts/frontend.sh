#Install node version manager
sudo su -
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

#Activate nvm
# Carga NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Use nvm to install the latest version of Node.js
nvm install node

#To install git
sudo yum update -y
sudo yum install git -y

#Run below command to clone the code repository from Github
git clone https://github.com/aljoveza/devops-rampup.git

#Ir al directorio del frontend
cd devops-rampup/movie-analyst-ui

#Install the dependencies
npm install
npm start &
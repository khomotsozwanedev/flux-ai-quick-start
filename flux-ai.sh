#!/bin/bash

echo "System set up"

# Update the package list
sudo apt-get update

# Upgrade installed packages
sudo apt-get upgrade -y

# Install general tools
sudo apt-get install -y build-essential curl wget git
sudo apt-get install -y vim nano
sudo apt-get install -y net-tools
sudo apt-get install -y htop
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt-get install -y python3.10
sudo apt install -y python3.10-venv
sudo apt install -y python3-pip
sudo apt-get install -y libgl1-mesa-glx
python3 --version
sudo apt-get autoremove -y
sudo apt-get clean

echo -e "You are running the Flux AI Setup script. \n\nYou will need an access token from Hugging Face. You will need at least 100GB storage with fast internet. You may also run the following script on a VM with 16GB or more RAM."

# Initialize variables
accessToken=""
modelName=""

echo "Huggingface access token: $accessToken"
echo "flux model name: $modelName"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --accessToken) accessToken="$2"; shift ;;
        --modelName) modelName="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Use accessToken variable
if [ -z "$accessToken" ]; then
    echo "Huggingface access token is required. Use --accessToken to provide it."
    exit 1
fi

if [ -z "$modelName" ]; then
    echo "Flux model name is required. [flux-dev or flux-schell] Use --modelName to provide it."
    exit 1
fi

echo "Huggingface access token: $accessToken"
echo "flux model name: $modelName"

cd $HOME && git clone https://github.com/black-forest-labs/flux
pwd
cd $HOME/flux
pwd
python3.10 -m venv .venv
source .venv/bin/activate
pip install -e ".[all]"
pip install streamlit


# Install huggingface cli
pip install -U "huggingface_hub[cli]"

# Login to hugging face
git config --global credential.helper store

echo "Logging into Hugging Face now and adding token to the system"
huggingface-cli login --token $accessToken --add-to-git-credential


# Print the logged in user
huggingface-cli whoami

# Running the model in interactive mode
echo -e "The script will now download the model and model weights on first run and prepare the environment for inference. \n\nThis will take a long time to download the model as it is more than 50GB in size."
pwd
python -m flux --name $modelName --loop

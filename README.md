# flux-ai-quick-start

Flux-AI Model is a script that allows users to install the Flux Models (https://github.com/black-forest-labs/flux) dev or schell image generation models on a local machine. This project is designed to simplify the process of setting up and using these powerful image generation models.

## Requirements

To get started with Flux-AI Model, you will need:

- Access token from [Huggingface](https://huggingface.co/settings/tokens), save this somewhere safe a
- A Linux VM (optimal) or a machine running Ubuntu (optional)
- At least 16GB RAM (64GB is optimal)
- At least 100GB storage
- Good internet connection to install everything
- Option to use a cloud-hosted VM or local machine

## Installation

Follow these steps to set up the Flux-AI model script:

1. **Pull the Repository**:
   - git clone [https://github.com/khomotsozwanedev/flux-ai-quick-start.git](https://github.com/khomotsozwanedev/flux-ai-quick-start.git)
   - cd flux-ai-model
2. **make the script file executable**
   - chmod +x flux-ai.sh

## Running the installation script

Folllwing these steps to run the script, this will then setup the VM and download the models before allowing your to access the image generation prompt

1. **run the command**
   - ./flux-ai.sh --accessToken {accessToken} --modelName {["dev", "schell"]}

## Status
The script works well, installs are required dependencies. 
### Todo 
- I need to update the python code in the downloaded flux model repo to extract the generated images, at the moment the output directory is empty after running a generation.
- Add some logging to see the progress of the image generation (if possible)
- Add a way to access the images or save them somewhere available on the internet.


## Author
Khomotso Zwane

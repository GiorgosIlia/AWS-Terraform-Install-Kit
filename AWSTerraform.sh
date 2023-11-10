#!/bin/bash

# Function to install AWS CLI
install_aws_cli() {
    echo "Installing AWS CLI..."
    if command -v aws &>/dev/null; then
        echo "AWS CLI is already installed."
    else
        if command -v apt-get &>/dev/null; then
            sudo apt-get update
            sudo apt-get install -y awscli
        elif command -v yum &>/dev/null; then
            sudo yum install -y aws-cli
        else
            echo "Unsupported package manager. Please install AWS CLI manually."
            exit 1
        fi
        echo "AWS CLI installed successfully."
    fi
}

# Function to install Terraform
install_terraform() {
    echo "Installing Terraform..."
    if command -v terraform &>/dev/null; then
        echo "Terraform is already installed."
    else
        # Download and install Terraform binary
        TERRAFORM_VERSION="0.14.7"  # Specify the desired Terraform version
        wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        sudo mv terraform /usr/local/bin/
        rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
        echo "Terraform installed successfully."
    fi
}

# Main script
install_aws_cli
install_terraform

echo "Setup completed."

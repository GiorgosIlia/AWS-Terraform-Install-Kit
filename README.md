# AWS CLI and Terraform Installation Script

This script automates the installation of the AWS CLI and Terraform on a Linux system using common package managers. Make sure to review and modify the script according to your system requirements.

## Usage

1. Save the script in a file, for example, `install_aws_terraform.sh`.
2. Make the script executable:

    ```bash
    chmod +x install_aws_terraform.sh
    ```

3. Run the script:

    ```bash
    ./install_aws_terraform.sh
    ```

## Installation Script

```bash
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

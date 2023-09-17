#!/bin/bash

# fail on any error
set -eu

# Check if CLIENT_TOOLS_DOWNLOAD_DISABLED is set to true
if [ "${CLIENT_TOOLS_DOWNLOAD_DISABLED}" = "true" ]; then
  echo "Client tools download is disabled. Skipping installation."
  exit 0
fi

# Check if INSTALL_CLIENT_TOOLS_IN_BACKGROUND is set to true
if [ "${INSTALL_CLIENT_TOOLS_IN_BACKGROUND}" = "true" ]; then
  echo "Installing client tools in the background..."
  # Add your installation commands for client tools here
else
  # install yum-config-manager to manage your repositories
  sudo yum install -y yum-utils

  # use yum-config-manager to add the official HashiCorp Linux repository
  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

  # install terraform
  sudo yum -y install terraform

  # verify terraform is installed
  terraform --version
fi


# This is original 
# #!/bin/bash

# # fail on any error
# set -eu

# # install yum-config-manager to manage your repositories
# sudo yum install -y yum-utils

# # use yum-config-manager to add the official HashiCorp Linux repository
# sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# # install terraform
# sudo yum -y install terraform

# # verify terraform is installed
# terraform --version

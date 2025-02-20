#!/bin/bash

# Check if directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <base_directory>"
    echo "Example: $0 /SSD/zchin"
    exit 1
fi

# Get base directory from argument
BASE_DIR="$1/conda"

# Confirm with user
echo "This will set up conda directories in: ${BASE_DIR}"
read -p "Continue? (y/n): " confirm
if [[ $confirm != [yY] ]]; then
    echo "Setup cancelled"
    exit 0
fi

# Create necessary directories
echo "Creating directories..."
mkdir -p "${BASE_DIR}/envs"
mkdir -p "${BASE_DIR}/pkgs"

# Check if directories were created successfully
if [ ! -d "${BASE_DIR}/envs" ] || [ ! -d "${BASE_DIR}/pkgs" ]; then
    echo "Error: Failed to create directories. Check permissions and path."
    exit 1
fi

# Configure conda to use new locations
echo "Configuring conda directories..."
conda config --add envs_dirs "${BASE_DIR}/envs"
conda config --add pkgs_dirs "${BASE_DIR}/pkgs"

# Verify the changes
echo "Verifying configuration..."
echo "Environment directories:"
conda config --show envs_dirs
echo -e "\nPackage directories:"
conda config --show pkgs_dirs

# Clean up old cache
echo -e "\nCleaning up old cache..."
conda clean --all -y

echo -e "\nSetup complete! New conda environments and packages will be stored in ${BASE_DIR}"
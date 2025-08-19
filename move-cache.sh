#!/bin/bash

# Check if directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <base_directory>"
    echo "Example: $0 /SSD/zchin"
    exit 1
fi

# Get base directory from argument and cache paths
BASE_DIR="$1/cache"
HOME_CACHE="$HOME/.cache"

# Confirm with user
echo "This will:"
echo "1. Move your home cache directory to: ${BASE_DIR}"
echo "2. Create symbolic link from ${HOME_CACHE} to ${BASE_DIR}"
read -p "Continue? (y/n): " confirm
if [[ $confirm != [yY] ]]; then
    echo "Setup cancelled"
    exit 0
fi

# Create backup directory with timestamp
BACKUP_DIR="${HOME}/.cache_backup_$(date +%Y%m%d_%H%M%S)"
echo "Creating backup directory: ${BACKUP_DIR}"
mkdir -p "${BACKUP_DIR}"

# Check if cache directory exists and backup
if [ -d "$HOME_CACHE" ]; then
    echo "Backing up existing cache directory..."
    mv "$HOME_CACHE" "$BACKUP_DIR/"
elif [ -L "$HOME_CACHE" ]; then
    echo "Removing existing symbolic link..."
    rm "$HOME_CACHE"
fi

# Create new cache directory
echo "Creating new cache directory..."
mkdir -p "${BASE_DIR}"

# Check if directory was created successfully
if [ ! -d "${BASE_DIR}" ]; then
    echo "Error: Failed to create directory. Check permissions and path."
    exit 1
fi

# Copy contents from backup to new location
echo "Copying cache contents to new location..."
cp -r "${BACKUP_DIR}/.cache/"* "${BASE_DIR}/" 2>/dev/null || true

# Create symbolic link
echo "Creating symbolic link..."
ln -s "${BASE_DIR}" "$HOME_CACHE"

# Verify symlink
echo -e "\nVerifying symbolic link..."
ls -l "$HOME_CACHE"

echo -e "\nSetup complete!"
echo "Cache is now stored in ${BASE_DIR}"
echo "Symbolic link created at ${HOME_CACHE}"
echo "Original files backed up to ${BACKUP_DIR}"
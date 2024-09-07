#!/bin/sh

printf "\n\n"
echo "Welcome to TeQA v0.1.0 Installer!"
printf "\n\n"
echo "feel free to submit any question, problem, or sugestion here <https://github.com/hayinfx/teqa/discussions>"

printf "\n\n"
echo -n "Processing   "
spinner='|/-\'  # Define the spinner characters as a simple string
i=0
while [ $i -lt 25 ]; do  # Loop 25 times, each iteration taking 0.1 seconds (for a total of 25 seconds)
    i=$((i + 1))
    # Manually get the spinner character using expr to be compatible with basic sh
    idx=$(expr $i % 4)
    char=$(echo "$spinner" | cut -c$((idx + 1)))  # Extract character from spinner string
    printf "\b$char"  # Print the character
    sleep 0.1  # Wait for 0.1 seconds
done
printf "\b "  # Clear the spinner character

# Proceed with the rest of the script
printf "\n\n"

# Install p7zip and check if the installation was successful
printf "\n\n"
echo "Installing p7zip..."
printf "\n\n"
pkg install p7zip -y
if [ $? -eq 0 ]; then
printf "\n\n"
    echo "p7zip installation successful!"
    printf "\n\n"
else
    echo "p7zip installation failed!"
    printf "\n\n"
    exit 1
fi
printf "\n\n"

# Navigate to the directory containing files
cd ~/teqa

# Extract the files and check if extraction was successful
echo "Starting extraction of alpine.7z Archive split and rejoining them into alpine.img..."
printf "\n\n"
7z x alpine.7z.001 -o./ -y
if [ $? -eq 0 ]; then
printf "\n\n"
    echo "Extraction alpine.7z successful!"
    printf "\n\n"
else
    echo "Extraction alpine.7z failed!"
    printf "\n\n"
fi

# Calculate the MD5 hash of alpine.img

printf "\n\n"
echo "Calculate the MD5 hash of alpine.img..."
printf "\n\n"

calculated_md5=$(md5sum alpine.img | awk '{ print $1 }')

# Read the stored MD5 hash from alpine.md5hash
stored_md5=$(awk '{ print $1 }' alpine.md5hash)

# Display the original and new MD5 hashes
echo "Original MD5 hash of alpine.img (github) : $stored_md5"
echo "New MD5 hash of alpine.img (local disk) : $calculated_md5"

printf "\n\n"

# Compare the two hashes
if [ "$calculated_md5" = "$stored_md5" ]; then
    # If they match, run the next command
    echo "alpine.img MD5 hash matches. installation finished!."
printf "\n\n"

printf "\n\n"

# ANSI escape codes for colors
ORANGE='\033[38;5;208m'  # Approximate orange color
RESET='\033[0m'          # Reset to default color

echo -! "${ORANGE}IMPORTANT: delete \"install.sh\" to prevent accidentally running install.sh. Executing install.sh after finishing installation will replace your existing alpine.img and your entire data inside alpine.img raw disk image!${RESET}"

printf "\n\n"

echo "Alpine default login :"
printf "\n"
echo "username : hayinfx (root)" 
printf "\n"
echo "password : 12345"

printf "\n\n"

echo "type \"sh run_qemu.sh\" or \"./sh run_qemu.sh\" command inside "teqa" folder to launch TeQA Alpine."
printf "\n\n"
    exit
    
#Running the next command..."
    printf "\n\n"
    echo "Running run_qemu.sh..."
    # sh ./run_qemu.sh
else
    # If they don't match, display an error message and stop
    echo "Error: alpine.img has been modified or corrupted. Please re-clone the GitHub project."
    
    printf "\n\n"
    exit 1
fi


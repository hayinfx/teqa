#!/bin/sh

# Calculate the MD5 hash of alpine.img
calculated_md5=$(md5sum alpine.img | awk '{ print $1 }')

# Read the stored MD5 hash from alpine.md5hash
stored_md5=$(awk '{ print $1 }' alpine.md5hash)

# Compare the two hashes
if [ "$calculated_md5" = "$stored_md5" ]; then
    # If they match, run the next command
    echo "MD5 hash matches. Running the next command..."
    # Replace the following line with the command you want to run next
    sh your_next_script.sh
else
    # If they don't match, display an error message and stop
    echo "Error: alpine.org has been modified or corrupted. Please re-clone the GitHub project."
    exit 1
fi

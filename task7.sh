#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <public_key_file> <username> <ip_address>"
    exit 1
fi

public_key_file="$1"
username="$2"
ip_address="$3"

echo "Copying public key to remote server..."
ssh-copy-id -i "$public_key_file" "$username@$ip_address"

if [ $? -eq 0 ]; then
    echo "Public key copied successfully."
else
    echo "Failed to copy public key to remote server."
fi

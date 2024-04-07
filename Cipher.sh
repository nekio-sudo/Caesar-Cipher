#!/bin/bash

# Function to display the menu
display_menu() {
    clear  # Clear the terminal screen
    echo "*****************************************"
    echo "*               Caesar Cipher           *"
    echo "*****************************************"
    echo "1. Encrypt Text"
    echo "2. Decrypt Text"
    echo "3. Exit"
    echo "*****************************************"
    echo
}

# Function to generate a random shift value between -25 and 25
generate_random_shift() {
    shift=$((RANDOM % 51 - 25))  # Generates a random number between -25 and 25
    echo "$shift"
}

# Function to handle encryption
encrypt_text() {
    echo "*****************************************"
    read -p "Enter the text to encrypt: " text
    if [ -z "$text" ]; then
        echo "Error: Text cannot be empty."
        return
    fi

    shift=$(generate_random_shift)
    echo "*****************************************"
    echo "Randomly generated shift value: $shift"
    echo "*****************************************"
    python Encrypt.py "$text" "$shift"
    echo "*****************************************"
}

# Function to handle decryption
decrypt_text() {
    echo "*****************************************"
    read -p "Enter the text to decrypt: " encrypted_text
    if [ -z "$encrypted_text" ]; then
        echo "Error: Encrypted text cannot be empty."
        return
    fi

    echo "*****************************************"
    echo "Decrypting with all possible shift values:"
    echo "*****************************************"
    python Decrypt.py "$encrypted_text"
    echo "*****************************************"
}

# Loop to display the menu and process user input
while true; do
    display_menu  # Display the menu
    read -p "Enter your choice (1-3): " choice  # Prompt the user for input

    case $choice in
        1)
            encrypt_text
            ;;
        2)
            decrypt_text
            ;;
        3)
            echo "*****************************************"
            echo "Exiting the program. Goodbye!"
            echo "*****************************************"
            exit 0  # Exit the script with code 0 (success)
            ;;
        *)
            echo "*****************************************"
            echo "Invalid choice. Please enter a number from 1 to 3."
            echo "*****************************************"
            ;;
    esac

    read -p "Press Enter to continue..."  # Pause until Enter key is pressed
done

import sys
import random

def caesar_cipher_encrypt(text, shift):
    encrypted_text = ""
    for char in text:
        if char.isalpha():  # Check if the character is alphabetic
            offset = ord('A') if char.isupper() else ord('a')
            encrypted_text += chr((ord(char) - offset + shift) % 26 + offset)
        else:
            encrypted_text += char  # Non-alphabetic characters remain unchanged
    return encrypted_text

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python Encrypt.py <text> <shift>")
        sys.exit(1)

    text = sys.argv[1]
    try:
        shift = int(sys.argv[2])
    except ValueError:
        print("Error: Shift value must be an integer.")
        sys.exit(1)

    encrypted_text = caesar_cipher_encrypt(text, shift)
    print("Encrypted text:", encrypted_text)

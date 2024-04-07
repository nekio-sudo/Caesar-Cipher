import sys

def caesar_cipher_decrypt(encrypted_text, shift):
    decrypted_text = ""
    for char in encrypted_text:
        if char.isalpha():  
            offset = ord('A' if char.isupper() else 'a')
            decrypted_text += chr((ord(char) - offset - shift) % 26 + offset)
        else:
            decrypted_text += char  
    return decrypted_text

def decrypt_with_all_shifts(encrypted_text):
    print("Attempting all possible shift values:")
    for shift in range(-25, 26):
        decrypted_text = caesar_cipher_decrypt(encrypted_text, shift)
        print(f"Shift value {shift}: {decrypted_text}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python Decrypt.py <encrypted_text>")
        sys.exit(1)

    encrypted_text = sys.argv[1]
    decrypt_with_all_shifts(encrypted_text)

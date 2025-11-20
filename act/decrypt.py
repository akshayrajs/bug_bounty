import base64
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

# Same constants used in your JS code
firstAuto = "QV4wX2nxCsNxCJHD@"      # IV string
lastAuto = "IJ&Kl$!QV#?NwG@D@%"       # Key string

# Derive IV and Key like CryptoJS does
iv = firstAuto.split("@")[0].encode("utf-8")    # "QV4wX2nxCsNxCJHD"
key = lastAuto.split("@%")[0].encode("utf-8")   # "IJ&Kl$!QV#?NwG@D@"

def decrypt(ciphertext_b64: str) -> str:
    # Decode Base64
    ciphertext = base64.b64decode(ciphertext_b64)

    # AES-CBC with same key and IV
    cipher = AES.new(key, AES.MODE_CBC, iv)

    # Decrypt + unpad
    plaintext = unpad(cipher.decrypt(ciphertext), AES.block_size)

    return plaintext.decode()

if __name__ == "__main__":
    encrypted_input = input("Enter encrypted string: ")
    print("Decrypted:", decrypt(encrypted_input))


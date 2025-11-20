import base64
import os

os.system("pip install pycryptodome")
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad

# Same constants used in the JS code
firstAuto = "QV4wX2nxCsNxCJHD@"      # IV string
lastAuto = "IJ&Kl$!QV#?NwG@D@%"       # Key string

# Derive IV and Key exactly like the JS does
iv = firstAuto.split("@")[0].encode("utf-8")    # "QV4wX2nxCsNxCJHD"
key = lastAuto.split("@%")[0].encode("utf-8")   # "IJ&Kl$!QV#?NwG@D@"

def encrypt(plaintext: str) -> str:
    cipher = AES.new(key, AES.MODE_CBC, iv)
    padded = pad(plaintext.encode(), AES.block_size)
    encrypted = cipher.encrypt(padded)
    return base64.b64encode(encrypted).decode()

if __name__ == "__main__":
    for text in range (103761259504,103762000000):
	    print(encrypt(str(text)))

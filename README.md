# Encrypt-and-Decrypt
Encrypt & Decrypt is a batch file that has a simple user interface which allows the user to encryt file(s) and use the same batch file to decrypt them.
![Encypt and Decrypt Main Menu](https://modernnerds.io/wp-content/uploads/2023/04/encrypt_decrypt_main.png)

# Encryption
The encryption used is AES 256 bit with 100000 interations. It also uses PBKDF2 (Password-Based Key Derivation Function 2) which is a key derivation function that is used to derive cryptographic keys from a password or passphrase. It is designed to be computationally intensive, making it more difficult for attackers to guess the password or passphrase.

# OpenSSL
OpenSSL is required but comes built in. Make sure you select option 3 from the main menu before trying to encrypt or decrypt anything.
The batch script will automatically check if you have OpenSSL installed. If you don't it will download the installer. Follow the installer prompts, clicking next until you have went through the entire installer. The script will then check to make sure OpenSSL was successfully installed. If so, it will then check to make sure the enviromental variable PATH is correctly setup. If it's not, it will add OpenSSL to the variables table. After this is completed you will be able to encrypt and decrypt.
![OpenSSL Checker/Installer](https://modernnerds.io/wp-content/uploads/2023/04/encrypt_decrypt_openssl.png)
![OpenSSL Enviromental PATH Adder/Checker](https://modernnerds.io/wp-content/uploads/2023/04/encrypt_decrypt_openssl_path.png)

# Encryption Process
Find the file(s) you want to encrypt then add them to the "File(s) to Encrypt" folder. Run the Encrypt and Decrypt.bat file and select the Encrypt option. It will display a list of all the files inside the "File(s) to Ecrypt" Folder. Each file will have a designated number by it. (ex: [0]Image.jpg, [1]File.txt) Select the file you want my entering the corrosponding number into the command window. Add your passphrase used to encrypt. It will ask if you want to delete the original (unencrypted) file. 
![Encrypt Screen](https://modernnerds.io/wp-content/uploads/2023/04/encrypt_decrypt_encrypt.png)

# Decryption Process
Very similar to the encrypt process. Find the file(s) you want to Decrypt then add them to the "File(s) to Decrypt" folder. Run the Encrypt and Decrypt.bat file and select the Decrypt option. It will display a list of all the files inside the "File(s) to Decrypt" Folder. Each file will have a designated number by it. (ex: [0]Image.jpg.enc, [1]File.txt.enc) Only encrypted files with the .enc file extension will be shown. Select the file you want my entering the corrosponding number into the command window. Enter the passphrase used to encrypt the file(s) originally. It will ask if you want to delete the original (encrypted) file. 
![Decrypt Screen](https://modernnerds.io/wp-content/uploads/2023/04/encrypt_decrypt_decrypt.png)

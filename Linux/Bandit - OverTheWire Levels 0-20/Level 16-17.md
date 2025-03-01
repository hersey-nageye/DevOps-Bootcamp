## Level 16-17  

### Level Objective  
The credentials for the next level can be retrieved by submitting the password of the current level to a port on `localhost` in the range `31000` to `32000`. First, find out which ports have a server listening, then find which ones support SSL/TLS. There is only one correct server that provides the next credentials.

### Commands Required  
- `nmap` – Scan for open ports  
- `openssl` – Establish a secure SSL/TLS connection  
- `ssh` – Securely connect to remote systems  
- `scp` – Securely copy files between systems  
- `vim` – Create or edit text files  

### Solution  
1. Connect to the `bandit16` server using the `ssh` command. When prompted, enter the password obtained from the last challenge.  
2. Enter `nmap -p 31000-32000 localhost` to find all available ports.  
3. Use `openssl s_client -connect localhost:<PORT> -quiet` on each open port to find the one that supports SSL/TLS.  
4. Once found, enter `openssl s_client -connect localhost:<CORRECT_PORT> -quiet` to reveal the private key.  
5. Copy this private key, then move into the `/tmp` directory and create a file using `vim banditkey`. Paste the private key inside and save the file.  
6. On a new terminal, enter `scp -P 2220 bandit16@bandit.labs.overthewire.org:/tmp/banditkey .` on your local machine. When prompted, enter the password from the last challenge.  
7. Enter `chmod 600 banditkey` to set correct permissions.  
8. Use `ssh -i banditkey bandit17@bandit.labs.overthewire.org -p 2220` to log into `bandit17`. You should not be prompted for a password.  
9. Enter `cat /etc/bandit_pass/bandit17` to reveal the password for the next challenge.  
10. Enter `exit` to leave the `bandit16` server. 
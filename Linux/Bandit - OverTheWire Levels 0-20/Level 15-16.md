## Level 15-16  

### Level Objective  
The password for the next level can be retrieved by submitting the password of the current level to port `30001` on `localhost` using SSL/TLS encryption.

### Commands Required  
- `ssh` – Securely connect to remote systems  
- `openssl` – Establish a secure SSL/TLS connection  

### Solution  
1. Connect to the `bandit15` server using the `ssh` command. When prompted, enter the password obtained from the last challenge.  
2. Enter `openssl s_client -connect localhost:30001 -quiet` to connect to `localhost` on port `30001`. When prompted, enter the password from the last level to reveal the new password.  
3. Enter `exit` to exit the `bandit15` server.  
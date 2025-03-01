## Level 14-15  

### Level Objective  
The password for the next level can be retrieved by submitting the password of the current level to port `30000` on `localhost`.

### Commands Required  
- `ssh` – Securely connect to remote systems  
- `telnet` – Connect to ports  

### Solution  
1. Connect to the `bandit14` server using the `ssh` command. When prompted, enter the password obtained from the last challenge.  
2. Enter `telnet localhost 30000` to connect to port `30000`.  
3. When prompted, enter the password for the previous challenge to reveal the new password.  
4. Enter `exit` to exit the `bandit14` server.  
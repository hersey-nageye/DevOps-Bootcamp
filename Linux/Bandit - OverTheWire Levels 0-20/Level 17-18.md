## Level 17-18  

### Level Objective  
There are two files in the home directory: `passwords.old` and `passwords.new`. The password for the next level is the only line that has changed between `passwords.old` and `passwords.new`.

### Commands Required  
- `diff` – Find differences between two files  
- `ssh` – Securely connect to remote systems  

### Solution  
1. Connect to the `bandit17` server using the `ssh` command. When prompted, enter the password obtained from the last challenge.  
2. Enter `diff passwords.old passwords.new` to reveal the password for the next challenge. The password will be marked with `>`.  
3. Enter `exit` to exit the `bandit17` server.  
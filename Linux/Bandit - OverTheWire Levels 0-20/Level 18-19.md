## Level 18-19  

### Level Objective  
The password for the next level is stored in a file `readme` in the home directory. However, `.bashrc` has been modified to log you out immediately upon login.

### Commands Required  
- `ssh` – Securely connect to remote systems  
- `cat` – Print file contents  

### Solution  
1. To bypass the `.bashrc` execution, enter `ssh bandit18@bandit.labs.overthewire.org -p 2220 /bin/sh` to open a non-interactive shell. Enter the password from the last challenge when prompted.  
2. Once inside the `bandit18` server, enter `cat /home/bandit18/readme` to reveal the password required for the next challenge.  
3. Enter `exit` to exit the `bandit18` server.  
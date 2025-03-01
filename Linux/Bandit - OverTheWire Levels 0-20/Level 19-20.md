## Level 19-20  

### Level Objective  
To gain access to the next level, use the setuid binary in the home directory. Execute it without arguments to find out how to use it. The password for this level can be found in `/etc/bandit_pass` after executing the setuid binary.

### Commands Required  
- `ls` – List files and directories  
- `cat` – Print file contents  
- `ssh` – Securely connect to remote systems  

### Solution  
1. Connect to the `bandit19` server using the `ssh` command. When prompted, enter the password obtained from the last challenge.  
2. Enter `ls -l` to view file details in the current directory. You should see a file with `rws` permissions named `bandit20-do`.  
3. Enter `./bandit20-do cat /etc/bandit_pass/bandit20` to run the executable and reveal the password for the next challenge.  
4. Enter `exit` to exit the `bandit19` server.  
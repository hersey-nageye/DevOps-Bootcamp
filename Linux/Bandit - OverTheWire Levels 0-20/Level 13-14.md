## Level 13-14  

### Level Objective  
The password for the next level is stored in `/etc/bandit_pass/bandit14`, but can only be accessed with a provided private SSH key.  

### Commands Required  
- `cat`, `ls`, `ssh`, `scp`, `chmod`  

### Solution  
1. Connect to the `bandit13` server using `ssh`.
2. Locate the private SSH key:
   ```sh
   ls
   ```
3. Copy the key to your local machine:
   ```sh
   scp -P 2220 bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private .
   ```
4. Set correct permissions:
   ```sh
   chmod 600 sshkey.private
   ```
5. Connect to the next level using:
   ```sh
   ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
   ```
6. Retrieve the password:
   ```sh
   cat /etc/bandit_pass/bandit14
   ```
7. Enter `exit` to leave the `bandit13` server.

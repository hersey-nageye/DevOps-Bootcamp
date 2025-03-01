## Bandit Level 0-1

**Level Objective:**  
The password for the next level is stored in a file called `readme` located in the home directory.

**Commands Required:**
- `cat` - Display file contents
- `ls` - List directory contents
- `ssh` - Secure Shell, used to connect to remote systems

**Solution:**
1. List the files in the home directory:
   ```sh
   ls
   ```
2. Display the contents of `readme`:
   ```sh
   cat readme
   ```
3. Note down the password and use it to log into `bandit1` via SSH.
4. Exit the current session:
   ```sh
   exit
   ```
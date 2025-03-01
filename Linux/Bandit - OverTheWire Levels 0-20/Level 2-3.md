## Bandit Level 2-3

**Level Objective:**  
The password for the next level is stored in a file called `spaces in this filename` located in the home directory.

**Commands Required:**
- `cat`
- `ssh`

**Solution:**
1. Connect to `bandit2` via SSH.
2. Since the filename contains spaces, use quotes:
   ```sh
   cat "spaces in this filename"
   ```
3. Note down the password and exit:
   ```sh
   exit
   ```

## Level 9-10  

### Level Objective  
The password for the next level is stored in `data.txt` in one of the few human-readable strings, preceded by several `=` characters.  

### Commands Required  
- `ls` – List directory contents
- `ssh` – Secure shell login
- `grep` – Search for text patterns
- `strings` – Display readable lines of text  

### Solution  
1. Connect to the `bandit9` server using `ssh`.
2. Run the following command to extract the password:
   ```sh
   strings data.txt | grep '=='
   ```
3. Enter `exit` to leave the `bandit9` server.

## Level 7-8  

### Level Objective  
The password for the next level is stored in the file `data.txt` next to the word `millionth`.  

### Commands Required  
- `cat` – Print file contents
- `ls` – List directory contents
- `ssh` – Secure shell login
- `grep` – Search for text patterns  

### Solution  
1. Connect to the `bandit7` server using `ssh`.
2. Run the following command to find the password:
   ```sh
   cat data.txt | grep 'millionth'
   ```
3. Enter `exit` to leave the `bandit7` server.

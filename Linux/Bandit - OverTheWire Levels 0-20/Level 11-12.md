## Level 11-12  

### Level Objective  
The password for the next level is stored in `data.txt`, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions.  

### Commands Required  
- `cat` – Print file contents
- `ssh` – Secure shell login
- `tr` – Translate characters  

### Solution  
1. Connect to the `bandit11` server using `ssh`.
2. Run the following command to decode the password:
   ```sh
   cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
   ```
3. Enter `exit` to leave the `bandit11` server.
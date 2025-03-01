## Level 8-9  

### Level Objective  
The password for the next level is stored in `data.txt` and is the only line of text that occurs only once.  

### Commands Required  
- `ls` – List directory contents
- `ssh` – Secure shell login
- `sort` – Sort lines of text
- `uniq` – Filter unique lines  

### Solution  
1. Connect to the `bandit8` server using `ssh`.
2. Run the following command to find the unique line:
   ```sh
   sort data.txt | uniq -u
   ```
3. Enter `exit` to leave the `bandit8` server.

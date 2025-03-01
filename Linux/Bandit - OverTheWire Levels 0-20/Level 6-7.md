## Level 6-7  

### Level Objective  
The password for the next level is stored somewhere on the server and has all of the following properties:
- Owned by user `bandit7`
- Owned by group `bandit6`
- 33 bytes in size  

### Commands Required  
- `cat` – Print file contents
- `ls` – List directory contents
- `ssh` – Secure shell login
- `find` – Search for files  

### Solution  
1. Connect to the `bandit6` server using the `ssh` command.
2. Run the following command to locate the file with the given properties:
   ```sh
   find / -user bandit7 -group bandit6 -size 33c 2> /dev/null
   ```
   This searches from the root directory (`/`) and redirects errors to `/dev/null`.
3. Run `cat /var/lib/dpkg/info/bandit7.password` to reveal the password.
4. Enter `exit` to leave the `bandit6` server.

---

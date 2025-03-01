## Level 10-11  

### Level Objective  
The password for the next level is stored in `data.txt`, which contains base64 encoded data.  

### Commands Required  
- `ssh` – Secure shell login
- `base64` – Encode/decode base64 data  

### Solution  
1. Connect to the `bandit10` server using `ssh`.
2. Run the following command to decode the password:
   ```sh
   base64 -d data.txt
   ```
3. Enter `exit` to leave the `bandit10` server.
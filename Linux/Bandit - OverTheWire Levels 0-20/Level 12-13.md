## Level 12-13  

### Level Objective  
The password for the next level is stored in `data.txt`, which is a hexdump of a repeatedly compressed file. Decompress it to retrieve the password.  

### Commands Required  
- `cat`, `ls`, `ssh`, `gunzip`, `bzip2`, `tar`, `mv`, `xxd`

### Solution  
1. Connect to the `bandit12` server using `ssh`.
2. Create a temporary directory and navigate into it:
   ```sh
   cd /tmp
   mktemp -d
   cd <new-directory>
   ```
3. Copy `data.txt` and reverse the hexdump:
   ```sh
   cp ~/data.txt .
   xxd -r data.txt > password
   ```
4. Use `file password` to determine the compression format.
5. Decompress repeatedly using `gzip -d`, `bzip2 -d`, `tar -xvf` as required.
6. Use `cat` to reveal the password.
7. Enter `exit` to leave the `bandit12` server.

## Bandit Level 3-4

**Level Objective:**  
The password for the next level is stored in a hidden file in the `inhere` directory.

**Commands Required:**
- `cat`
- `ls`
- `ssh`
- `cd`

**Solution:**
1. Connect to `bandit3` via SSH.
2. List all files, including hidden ones:
   ```sh
   ls -a
   ```
3. Change to the `inhere` directory:
   ```sh
   cd inhere
   ```
4. List files again to find the hidden one:
   ```sh
   ls -a
   ```
5. Display the contents of the hidden file:
   ```sh
   cat .hidden_file
   ```
6. Note down the password and exit:
   ```sh
   exit
   ```
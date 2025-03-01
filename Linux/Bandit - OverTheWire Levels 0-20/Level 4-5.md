## Bandit Level 4-5

**Level Objective:**  
The password for the next level is stored in the only human-readable file in the `inhere` directory.

**Commands Required:**
- `cat`
- `ls`
- `ssh`
- `file`

**Solution:**
1. Connect to `bandit4` via SSH.
2. Change to the `inhere` directory:
   ```sh
   cd inhere
   ```
3. Identify the human-readable file:
   ```sh
   file ./*
   ```
4. Display the contents of the ASCII text file:
   ```sh
   cat ./-file07
   ```
5. Note down the password and exit:
   ```sh
   exit
   ```
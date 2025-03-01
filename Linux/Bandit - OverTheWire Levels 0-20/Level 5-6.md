## Bandit Level 5-6

**Level Objective:**  
The password is stored in a file under `inhere` with the following properties:
- Human-readable
- 1033 bytes in size
- Not executable

**Commands Required:**
- `cat`
- `ls`
- `ssh`
- `find`

**Solution:**
1. Connect to `bandit5` via SSH.
2. Change to the `inhere` directory:
   ```sh
   cd inhere
   ```
3. Locate the required file:
   ```sh
   find . -readable -size 1033c ! -executable
   ```
4. Display the file’s contents:
   ```sh
   cat ./maybehere07/.file2
   ```
5. Note down the password and exit:
   ```sh
   exit
   ```
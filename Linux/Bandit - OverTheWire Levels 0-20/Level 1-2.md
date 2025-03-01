## Bandit Level 1-2

**Level Objective:**  
The password for the next level is stored in a file called `-` located in the home directory.

**Commands Required:**
- `cat`
- `ls`
- `ssh`

**Solution:**
1. Connect to `bandit1` using SSH:
   ```sh
   ssh bandit1@bandit.labs.overthewire.org -p 2220
   ```
2. List the files in the directory:
   ```sh
   ls
   ```
3. Use `cat` to read the file `-` by specifying its path:
   ```sh
   cat ./-
   ```
4. Note down the password and exit the session:
   ```sh
   exit
   ```
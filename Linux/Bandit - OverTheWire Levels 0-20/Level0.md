## Bandit Level 0

**Level Objective:**  
The goal of this level is to log into the game using SSH. The host is `bandit.labs.overthewire.org`, on port `2220`. The username is `bandit0`, and the password is `bandit0`.

**Commands Required:**
- `ssh` - Secure Shell, used to connect to remote systems

**Solution:**
1. Connect to the remote system using SSH:
   ```sh
   ssh bandit0@bandit.labs.overthewire.org -p 2220
   ```
2. Enter the password `bandit0` when prompted.
3. Once logged in, proceed to the next level.

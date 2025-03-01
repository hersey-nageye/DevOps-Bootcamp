# Bash Scripting Module

Welcome to the **Bash scripting module** of my DevOps learning journey! This section focuses on mastering Bash scripting, an essential skill for automation, system administration, and DevOps workflows. This README outlines the importance of Bash scripting, its role in DevOps, and key commands and concepts to guide me through this learning process.

## What is Bash Scripting?
Bash (Bourne Again SHell) is a powerful command-line interpreter and scripting language used in Unix-based systems like Linux and macOS. It enables automation of tasks, efficient system management, and plays a crucial role in DevOps, including CI/CD pipelines, infrastructure provisioning, and cloud automation.

## Key Concepts and Commands

### **Script Basics**
```bash
#!/bin/bash  # Shebang to define the script interpreter
echo "Hello, World!"  # Prints text to the terminal
chmod +x script.sh  # Makes the script executable
./script.sh  # Executes the script
```

### **Variables**
```bash
variable_name="value"  # Defines a variable
echo $variable_name  # Accesses a variable
readonly var  # Declares a read-only variable
unset var  # Deletes a variable
```

### **User Input**
```bash
read var_name  # Reads user input into a variable
read -p "Enter your name: " name  # Reads input with a prompt
```

### **Conditional Statements**
```bash
if [ condition ]; then
   # Code block
fi

if [ condition ]; then
   # Code block
else
   # Alternative block
fi

if [ condition ]; then
   # Code block
elif [ another_condition ]; then
   # Another block
fi
```

### **Loops**
```bash
for i in {1..5}; do
   echo "Iteration $i"
done

while [ condition ]; do
   command
done
```

### **Functions**
```bash
function_name() {
   commands
}

function_name  # Calls the function

function greet {
   echo "Hello, $1"
}
greet "User"  # Calls function with an argument
```

### **File Handling**
```bash
touch file.txt  # Creates a file
cat file.txt  # Reads a file
echo "Hello" > file.txt  # Writes to a file
echo "World" >> file.txt  # Appends to a file
rm file.txt  # Deletes a file
```

### **Process Management**
```bash
ps  # Lists running processes
kill PID  # Terminates a process
nohup script.sh &  # Runs a script in the background
```

### **Debugging**
```bash
bash -x script.sh  # Runs a script in debug mode
set -x  # Enables debugging within a script
set +x  # Disables debugging
```

### **Error Handling**
```bash
command || echo "Command failed"  # Executes fallback command on failure
set -e  # Exits script on error
set -u  # Treats unset variables as an error
```

## Resources
- [Bash Guide for Beginners](https://linuxconfig.org/bash-scripting-tutorial)
- [Bash Scripting Cheat Sheet](https://devhints.io/bash)
- [OverTheWire Bandit (Linux & Bash Challenges)](https://overthewire.org/wargames/bandit/)

---
This README serves as a quick reference for my Bash scripting journey, covering essential topics and commands. 🚀

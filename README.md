# Bash-Scripting-and-Shell-Programming
## IMPORTANT Links
1. [Bash Guide](https://guide.bash.academy/)
2. [Learn Linux programming](https://ryanstutorials.net/)
3. [Cheatsheets](https://devhints.io/)
## 1. Scripts
- Contains a series of commands.
- An interpreter executes commands in the script.
- Anything you can type at the command line, you can put in a script.
- Great for automating tasks.
- Ex: 1st script

```
Script.sh file
#!/bin/bash
echo "Scripting is fun!"

$ chmod 755 script.sh
$ ./script.sh
Scripting is fun!
$
```

```
#!/bin/bash
sleep 90
```
- `#!/bin/bash`: This is called a shebang or hashbang line. It tells the system that the script should be interpreted using the Bash shell, which is specified here as /bin/bash.
- sleep 90: This is the actual command in the script. It tells the system to pause for 90 seconds (1 minute and 30 seconds) before proceeding with any further commands in the script.
-  when you run `./scripts/sleepy.sh &`, you are executing the "sleepy.sh" script in the background. This means that the script will start running, but you can continue to use the terminal for other tasks without waiting for the script to complete. The script will execute independently in the background until it finishes its job or is manually terminated.
-  The ampersand at the end of the command is used for job control in a Unix-like shell. When you append `&` to a command, it typically runs the command in the background, allowing you to continue using the terminal for other tasks without waiting for the command to finish.
  
## Shebang
```
#!/bin/csh
echo "This script uses csh as the interpreter"
```

```
#!/bin/ksh
echo "This script uses ksh as the interpreter"
```

```
#!/bin/zsh
echo "This script uses zsh as the interpreter"
```

## Shebang or Not to Shebang
- If a script does not contain a shebang the commands are executed using your shell.
- Different shells have slightly varying syntax.

## More than just shell scripts
- Python script example
```
#!/usr/bin/python
print "This is a python script"

$ chmod 755 hi.py
$ ./hi.py
This is a python script.
$
```

## Variables
- Storage locations that have a name
- Name-value pairs
- `Syntax: VARIABLE_NAME="Value"`
- Variables are case sensitive.
- By convention variables are uppercase.
Ex: Assign command output to a variable
```
#!/bin/bash
SERVER_NAME=$(hostname)
echo "You are running this script on $SERVER_NAME"
```

## Test
- Used to evaluate expressions and conditions.
- Allows you to perform various test on values, file and strings to determine their truthfulness or to make decisions in your scripts.
Syntax: `[condition-to-test-for]`
- Ex: `[-e /etc/passwd]`
- `$man test` to know more

### File Operators(tests)
1. `-d FILE` -True if file is a directory
2. `-e FILE` -True if file exists
3. `-f FILE` -True if file exists and is a regular file.
4. `-r FILE` -True if file is readable by you
5. `-s FILE` -True if file is exists and is not empty.
6. `-w FILE` -True if the file is writable by you.
7. `-x FILE` -True if file is executable by you.

### String operators(tests)
1. `-z STRING` -True if string is empty.
2. `-n STRING` -True if string is not empty.

```
STRING1=STRING2
    True if the strings are equal
STRING1!=STRING2
    True if the strings are not equal
```

### Arithmetic Operators(Tests)
1. `arg1 -eq arg2` True if arg1 is equal to arg2
2. `arg1 -ne arg2` True if arg1 is not equal to arg2
3. `arg1 -lt arg2` True if arg1 is less than arg2
4. `arg1 -le arg2` True if arg1 is less than or equal to arg2
5. `arg1 -gt arg2` True if arg1 is greater than arg2
6. `arg1 -ge arg2` True if arg1 is greater than or equal to arg2

## Making Decisions - The if/elif/else statement
Syntax:
```
if [condition-is-true]
then
    command 1

elif [condition-is-true]
then
    command 2
else
    command M
fi
```
Ex:
```
#!/bin/bash
MY_SHELL="bash"

if [ "$MY_SHELL" = "bash" ] 
then 
    echo "Hi samyak you are genuis"
elif [ "$MY_SHELL" = "bash1"]
then
    echo "Hi samyak you are handsome"
else
    echo "Hi samyak you are extraordinary"
fi
```

## For loop
```
for VARIABLE_NAME in ITEM_1 ITEM_N
do 
    command 1
    command 2
    command N
done
```

## Positional Parameters
```
$ script.sh parameter1 parameter2 parameter3
```
$0: "script.sh"

$1: "parameter1"

$2: "parameter2"

$3: "parameter3"

Ex:
1. For single user
```
script.sh

#!/bin/bash
$USER = $1

echo "Executing script: $0"
echo "Archiving user: $USER"

#Lock the account
passwd -1 $USER

#Create an archive of the home directory
tar cf /archives/${USER}.tar.gz /home/${USER}

output:
$ ./script.sh samyak
Executing script: ./script.sh
Archiving user: samyak
passwd: password expiry information changed
tar: Removing leading `/` from member names
$
```
2. For multiple user
```
script.sh
#!/bin/bash

echo "Executing script: $0"

for USER in $@
do 
    echo "Archiving user: $USER"
    
    #Lock the account
    passwd -1 $USER

    #Create an archive of the home directory
    tar cf /archives/${USER}.tar.gz /home/${USER}
done

Output:
$ ./script.sh samyak vedang
Executing script: ./script.sh
Archiving user: samyak
passwd: password expiry information changed
tar: Removing leading `/` from member names
Archiving user: vedang
passwd: password expiry information changed
tar: Removing leading `/` from member names
$
```

## Accepting User Input(STDIN)
- The read command accepts STDIN
- Syntax: `read -p "PROMPT" VARIABLE`
Ex:
```
script.sh
#!/bin/bash

read -p "Enter a user name: " USER
echo "Archiving user: $USER"

#Lock the account
passwd -1 $USER

#Create an archive of the home directory.
tar cf /archives/${USER}.tar.gz /home/${USER}

output: 
$ ./script.sh
Enter a user name: samyak
Archiving user: samyak
passwd: password expiry information changed
tar: Removing leading `/` from member names
```






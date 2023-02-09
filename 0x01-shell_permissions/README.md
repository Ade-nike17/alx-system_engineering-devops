This readme describes what the scripts in these tasks does:
Script 0: Create a script that switches the current user to betty
#!/bin/bash
su betty

Script 1: Write a script that prints the effective username of current user
#!/bin/bash
whoami

Script 2: Write a script that prints all the groups the current user is part of
#!/bin/bash
groups

Script 3: Write a script that changes the owner of the file hello to the user betty
#!/bin/bash
sudo chown betty hello

Script 4: Write a script that creates an empty file called hello
#!/bin/bash
touch hello

Script 5: Write a script that adds execute permission to the owner of file
#!/bin/bash
chmod 744 hello

Script 6: Write a script that adds execute to the owner and the group owner, and read permission to other users, to the file hello
#!/bin/bash
chmod 754 hello
Add templates to /var/bash.bs : mv templates /var/bash/bs

and bashbs.sh to /usr/bin/bashbs for global usage: mv bashbs.sh /usr/bin/bashbs

##Understanding Build system

ref: https://j3t.ch/tech/what-is-a-build-system-illustrated/
https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/



 a build system is a particular kind of program that, taking your input, will output something that can be run and has a particular behavior: the build system spits out other programs.

 It has the following parts:
 Inputs: which is the code the dependencies and configs
 Program: Dependency Manager for linking and compiler for converting into executable .o's or .obj's

For the end-user, dependencies (and how to manage and retrieve them) are one of the most important aspects of what the build-system does for you

The compiler itself has no clue as to where to find these existing things, and this is where the dependency manager comes into play.

The build system’s main job is to properly orchestrate the dependency manager and the compiler, so that the latter always has what it needs available when compiling your code.

##Dependency trees and action graphs

steps that your build system needs to take in order to make something useful out of your code:

Analyze the direct dependencies
Download them along with all their transitive dependencies
Compile your code
Package your compiled code and its dependencies into a single useful binary.

Finally: The build system is what takes the necessary actions, in the correct order, to produce your desired output. It does so by walking through a directed and acyclical action graph

##Some Bash Scripting Info

The default shell for many Linux distros is the GNU Bourne-Again Shell (bash). Bash succeeded the Bourne shell (sh). When you first launch the shell, it uses a startup script located in the .bashrc or .bash_profile file which allows you to customize the behavior of the shell.

A bash script is a series of commands written in a file. These are read and executed by the bash program. The program executes line by line. File extension of .sh and can be identified with the shebang statement #! /bin/bash

###common commands
0. path to base shell via which bash

0.5 chmod [OPTIONS] NUMBER FILE
- NUMBER can be 3 or 4 digits no.
first digit repr permissions of file owner, second of file's group and last of all other users

r = 4
w = 2
x = 1

755,777 etc

1. echo "hello world"

2. Defining variables 
variable_name=value. To get the value of the variable, add $ before the variable.
Also could be var=$((expression))

3. Read user i/p 
read -p "Enter your age" variable_name

4. if statements 
if [ conditions ]
    then
         commands
fi
spacing to be followed strictly
can use -eq -ge -gt -le -lt -ne or signs as well for comparing expressions on two sides

5. conditional statements 
if...then...fi statements

if...then...else...fi statements

if..elif..else..fi

if..then..else..if..then..fi..fi.. (Nested Conditionals)

6. looping and skipping

for i in {1..5}
do
    echo $i
done




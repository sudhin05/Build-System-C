#!/bin/bash


pname=$1 #Grabs the first command-line argument e.g usage bashbs toralizer
pdir="./${pname}"
#install globally in envvar so could be used every time
tdir=/var/bash.bs/templates

usage(){
    >&2 echo "Usage: $0 <project>" # >&2 redirects the echo to treat this as a error/help message not as normal o/p
    return 0
}

if [ -z "$pname" ]; then #-z checks if string is zero length
    usage
    exit 1
elif ! [ -d "$tdir" ]; then #checks for directory existence
    >&2 echo "Unable to find template dir: $tdir"
    exit 2

elif [ -d "$pname" ]; then
    >&2 echo "Project dir already exists: $pdir"
    exit 3

fi

cur="$PWD"
cd $tdir
echo "Please select a template"
select x in *; do #select is a bash builtin that prints a no. list of all items matching * ever file in tdir, prompts user with #? by default and stores chosen item in template
    template="$x"
    break
done

cd $cur
cp -R ${tdir}/$template $pdir #copy qand enter new project directory -R recursive copy
cd $pdir

for x in *; do
    new=$(sed "s,PROJECTNAME,$pname,g" <<< "$x")
    if [ "$x" = "$new" ]; then 
        sed "s,PROJECTNAME,$pname,g" < $x > temp
        mv -f temp $x
    else 
        sed "s,PROJECTNAME,$pname,g" < $x > $new
        if [ -e "$new" ]; then
            rm -f $x
         fi
    fi
done

# Understanding sed
# syntax: sed "s,PROJECTNAME,$pname,g"
# s = substitute
# , = delimiter 
# PROJECTNAME = literal text to find
# $pname = what to replace it with
# g = “global” (replace all occurrences in the line)
# <<< "$x" is a “here-string” that feeds the filename (just a string) into sed on stdin.
# $( … ) captures sed’s output into the shell variable new.

# ex: sed "s,PROJECTNAME,$pname,g" <<< "PROJECTNAME-config.yml"
# If x="PROJECTNAME-config.yml" and pname="coolapp", then output is coolapp-config.yml

# two cases because some files are Makefile and otherws are PROJECTNAME.c and PROJECTNAME.h
# 1. The file’s name didn’t contain PROJECTNAME, but its contents might (maybe it’s a source file with PROJECTNAME placeholders)
# < $x tells sed to read the file’s contents.
# > temp writes the transformed contents to a temporary file.
# mv -f temp $x atomically replaces the original with the updated version.

# 2. When the filename itself contains PROJECTNAME, we need to:
# Rename the file (i.e. write its contents out under the new name).
# Only if that write succeeded (-e "$new"), delete the old file.


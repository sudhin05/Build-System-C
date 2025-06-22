#In makefiles, typically multiple cpp files in a project are compiled into machine code as obj files and have to be linked together\
calling g++ for multiple cpp files all at once even when only minor change to a file is made is slow, wasteful\
Makefile and make come in here, we create a file called makefile that tells make what to build, what files it depends on and how to build it\
Basic structure- target: dependencies then tab and command to build the target in next line\

#Applying optimization of 2 for the compiler -02, enabling warning messages -Wall, C23 standard
flags=-02 -Wall -std=c23
#Can specify Linker flags to link against sudhin-utils (su)
ldflags=-lsu

.PHONY: all clean #Treat all and clean as phony targets. Theyre just commands, not files

all: clean PROJECTNAME #Target all, dependencies clean and projectname

#cc default C compiler alias gcc, Expands to all the dependencies — here, PROJECTNAME.o, -o $@ output to file named in the target
PROJECTNAME: PROJECTNAME.o
        cc $(flags) $^ -o $@ $(ldflags)

PROJECTNAME.o: PROJECTNAME.c PROJECTNAME.h # $< is first dependency here PROJECTNAME.c
        cc $(flags) -c $<

clean: #This removes all intermediate and final compiled files
        rm -f *.o PROJECTNAME
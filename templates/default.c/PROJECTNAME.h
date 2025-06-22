/* PROJECTNAME.h*/

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <assert.h>
#include <errno.h>

// access to lots of nonstandard GNU/Linux extension functions, traditional functions  omitted from the POSIX , access to low-level functions, broken behavior for lots of POSIX-specified functions
#define _GNU_SOURCE

#define $8 (int8 *)
#define $6 (int16)
#define $2 (int32)
#define $4 (int64)
#define $c (char *)
#define $i (int)

typedef unsigned char int8;
typedef unsigned short int int16;
typedef unsigned int int32;
typedef unsigned long long int int64;


int main(int,char**){

}
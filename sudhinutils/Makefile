flags=-O3 -Wall -std=c2x -I.
ldflags=-fPIC -shared -ldl -D_GNU_SOURCE
libdir=/lib/x86_64-linux-gnu/
incdir=/usr/include

all: clean sudhinutils.so

install: sudhinutils.so
	cp sudhinutils.so $(libdir)/libsu.so
	cp sudhinutils.h  $(incdir)
	ldconfig

sudhinutils.so: sudhinutils.o
	cc ${flags} $^ -o $@ ${ldflags}

sudhinutils.o: sudhinutils.c
	cc ${flags} -c $^ $(ldflags)

clean:
	rm -f sudhinutils.o sudhinutils.so

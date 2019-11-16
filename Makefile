
CC=gcc
CFLAGS=-lm -lcfitsio
OPTFLAGS=-O3

all:
	$(basic)
	$(optimized)
	$(install)

basic:
	$(CC) -o stack_double stack_double.c $(CFLAGS)
	$(CC) -o stack_float stack_float.c $(CFLAGS)
	$(CC) -o stack_int stack_int.c $(CFLAGS)
	$(CC) -o stack_scaled stack_scaled.c $(CFLAGS)

optimized:
	$(CC) -o stack_doubleO3 stack_double.c $(CFLAGS) $(OPTFLAGS)
	$(CC) -o stack_floatO3 stack_float.c $(CFLAGS) $(OPTFLAGS)
	$(CC) -o stack_intO3 stack_int.c $(CFLAGS) $(OPTFLAGS)
	$(CC) -o stack_scaled stack_scaled.c $(CFLAGS) $(OPTFLAGS)

install:
	mv stack_{double,float,int,scaled} bin/
	mv stack_{double,float,int,scaled}O3 bin/

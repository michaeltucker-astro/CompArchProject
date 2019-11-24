
CC=gcc
CFLAGS=-lm

basic:
	$(CC) -o clipO0 sigclip.c -lm 
	$(CC) -o clipO1 sigclip.c -lm -O1
	$(CC) -o clipO2 sigclip.c -lm -O2
	$(CC) -o clipO3 sigclip.c -lm -O3


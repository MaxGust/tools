CC=gcc
EXEC=test

LIBS=
CFLAGS=-Wall -Werror -g -O2 -std=c99 $(INC)

SRCS=$(wildcard *.c)
OBJS=$(SRCS:%.c=%.o)

.PHONY: all clean

all:$(EXEC)

$(EXEC):$(LIBS) $(OBJS)
	$(CC) $(OBJS) -o $@ $(LIBS)

clean:
	rm -rf $(EXEC) *.o

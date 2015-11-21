# Thisis Makefile
CC = gcc

LIBS = -lm -lpthread\
	/home/courses/cse533/Stevens/unpv13e/libunp.a\

FLAGS = -g -O2

CFLAGS = ${FLAGS} -I/home/courses/cse533/Stevens/unpv13e/lib

all: server client odr

server: server.o
	${CC} ${FLAGS} -o server server.o ${LIBS}
server.o: server.c
	${CC} ${CFLAGS} -c server.c

client: client.o 
	${CC} ${FLAGS} -o client client.o ${LIBS}
client.o: client.c
	${CC} ${CFLAGS} -c client.c


odr: odr.o get_hw_addrs.o prhwaddrs.o
	${CC} ${FLAGS} -o odr odr.o get_hw_addrs.o prhwaddrs.o ${LIBS}

odr.o: odr.c
	${CC} ${CFLAGS} -c odr.c 

prhwaddrs: get_hw_addrs.o prhwaddrs.o
	${CC} ${CFLAGS} -o prhwaddrs prhwaddrs.o get_hw_addrs.o ${LIBS}

get_hw_addrs.o: get_hw_addrs.c
	${CC} ${CFLAGS} -c get_hw_addrs.c

prhwaddrs.o: prhwaddrs.c
	${CC} ${CFLAGS} -c prhwaddrs.c


# pick up the thread-safe version of readline.c from directory "threads"

clean:
	rm server server.o client client.o odr odr.o prhwaddrs.o get_hw_addrs.o


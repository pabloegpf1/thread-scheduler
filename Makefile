# Generated by configure from .in at Sun Jan 23 19:29:20 CET 2005

CC	= gcc
LD	= gcc

CFLAGS	= -g -Wall 
CFLAGS	+= -I. 
LDFLAGS	= libinterrupt.a
HEADERS = mythread.h queue.h my_io.h


OBJS	= RRSD.o queue.o my_io.o

LIBS	= -lm -lrt

SRCS	= $(patsubst %.o,%.c,$(OBJS))

PRGS	= main_rrsd

all: libinterrupt.a $(PRGS)

libinterrupt.a: interrupt.o
	ar -rv libinterrupt.a interrupt.o

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $*.c $(INCLUDE) -o $@ $(LIBS)

$(PRGS): $(OBJS)
$(PRGS): $(LIBS)
$(PRGS): % : %.o
	$(CC) $(CFLAGS) -o $@ $< $(OBJS) $(LDFLAGS) $(LIBS)

clean:
	-rm -f *.o *.a *~ $(PRGS)


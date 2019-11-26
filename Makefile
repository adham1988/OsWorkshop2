LEX=flex
LIBS=-lfl -lpthread
CC=gcc
CCFLAGS=-ggdb

PROG=code
TRASH=lex.yy.c $(PROG)

$(PROG): lex.yy.o
	$(CC) -ggdb -o $@ $^ $(LIBS) 

lex.yy.c: code.l
	$(LEX) code.l

%.o: %.c
	$(CC) $(CCFLAGS) -c -o $@ $^

PHONY: clean run

run: $(PROG)
	./$(PROG)

clean:
	rm -f *.o
	rm -f $(TRASH)


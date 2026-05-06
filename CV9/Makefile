CC = gcc
LIBS = -lfl -lm
CFLAGS = -Wall -Wno-implicit

all: kalkul_int kalkul_double deklar symtab

kalkul_int: kalkul_int.y kalkul_int.l
	bison -d kalkul_int.y -o kalkul_int.tab.c
	flex -I -o kalkul_int.yy.c kalkul_int.l
	$(CC) -o kalkul_int kalkul_int.tab.c kalkul_int.yy.c $(LIBS) $(CFLAGS)

kalkul_double: kalkul_double.y kalkul_double.l
	bison -d kalkul_double.y -o kalkul_double.tab.c
	flex -I -o kalkul_double.yy.c kalkul_double.l
	$(CC) -o kalkul_double kalkul_double.tab.c kalkul_double.yy.c $(LIBS) $(CFLAGS)

deklar: deklar.y deklar.l
	bison -d deklar.y -o deklar.tab.c
	flex -I -o deklar.yy.c deklar.l
	$(CC) -o deklar deklar.tab.c deklar.yy.c $(LIBS) $(CFLAGS)

symtab: symtab.y symtab.l
	bison -d symtab.y -o symtab.tab.c
	flex -I -o symtab.yy.c symtab.l
	$(CC) -o symtab symtab.tab.c symtab.yy.c $(LIBS) $(CFLAGS)

clean:
	rm -f *.c *.tab.h *.o kalkul_int kalkul_double deklar symtab
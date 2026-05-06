CC = gcc
LIBS = -lfl -lm
CFLAGS = -Wno-implicit -Wall

all: arit_vyraz kalkul_int

arit_vyraz: arit_vyraz.l arit_vyraz.y
	bison -d -v arit_vyraz.y -o arit_vyraz.tab.c
	flex -I -o arit_vyraz.yy.c arit_vyraz.l
	$(CC) -o arit_vyraz arit_vyraz.tab.c arit_vyraz.yy.c $(LIBS) $(CFLAGS)

kalkul_int: kalkul_int.l kalkul_int.y
	bison -d -v kalkul_int.y -o kalkul_int.tab.c
	flex -I -o kalkul_int.yy.c kalkul_int.l
	$(CC) -o kalkul_int kalkul_int.tab.c kalkul_int.yy.c $(LIBS) $(CFLAGS)

clean:
	rm -f *.c *.h *.o arit_vyraz kalkul_int

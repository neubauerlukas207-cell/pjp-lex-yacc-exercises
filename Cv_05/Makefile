all: tokenize stattab dyntab

tokenize: tokenize.l
	flex -o tokenize.yy.c tokenize.l
	gcc -o tokenize tokenize.yy.c -lfl

stattab: stattab.l
	flex -o stattab.yy.c stattab.l
	gcc -o stattab stattab.yy.c

dyntab: dyntab.l
	flex -o dyntab.yy.c dyntab.l
	gcc -o dyntab dyntab.yy.c -lfl

clean:
	rm -f tokenize tokenize.yy.c stattab stattab.yy.c dyntab dyntab.yy.c
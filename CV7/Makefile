all: parser3 parser4

parser3: parser3.l parser3.y
	bison -d parser3.y -o parser3.tab.c
	flex -o parser3.lex.c parser3.l
	gcc parser3.tab.c parser3.lex.c -o parser3 -lfl

parser4: parser4.l parser4.y
	bison -d parser4.y -o parser4.tab.c
	flex -o parser4.lex.c parser4.l
	gcc parser4.tab.c parser4.lex.c -o parser4 -lfl

clean:
	rm -f parser3 parser4 *.tab.c *.tab.h *.lex.c

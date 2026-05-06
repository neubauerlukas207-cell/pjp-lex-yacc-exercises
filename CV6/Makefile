all: parser1 parser2

parser1: parser1.l
	flex parser1.l
	gcc lex.yy.c -o parser1 -lfl

parser2: parser2.c
	gcc parser2.c -o parser2

clean:
	rm -f parser1 parser2 lex.yy.c

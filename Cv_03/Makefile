all: ahoj_1 ahoj_2 abba abc

ahoj_1: ahoj_1.l
	flex -o ahoj_1.yy.c ahoj_1.l
	gcc -o ahoj_1 ahoj_1.yy.c -lfl

ahoj_2: ahoj_2.l
	flex -o ahoj_2.yy.c ahoj_2.l
	gcc -o ahoj_2 ahoj_2.yy.c -lfl

abba: abba.l
	flex -o abba.yy.c abba.l
	gcc -o abba abba.yy.c -lfl

abc: abc.l
	flex -o abc.yy.c abc.l
	gcc -o abc abc.yy.c -lfl

clean:
	rm -f ahoj_1 ahoj_1.yy.c ahoj_2 ahoj_2.yy.c abba abba.yy.c abc abc.yy.c
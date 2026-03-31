all: exten comments wordcount cmdline

exten: exten.l
	flex -o exten.yy.c exten.l
	gcc -o exten exten.yy.c -lfl

comments: comments.l
	flex -o comments.yy.c comments.l
	gcc -o comments comments.yy.c -lfl

wordcount: wordcount.l
	flex -o wordcount.yy.c wordcount.l
	gcc -o wordcount wordcount.yy.c -lfl

cmdline: cmdline.l
	flex -o cmdline.yy.c cmdline.l
	gcc -o cmdline cmdline.yy.c -lfl

clean:
	rm -f exten exten.yy.c comments comments.yy.c wordcount wordcount.yy.c cmdline cmdline.yy.c
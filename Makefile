FILE=hello_lex

all:
	flex -o $(FILE).yy.c $(FILE).l
	gcc $(FILE).yy.c -lfl -o $(FILE).out
	./$(FILE).out < input.txt > output.txt

c:
	rm *.c *.out *.h 

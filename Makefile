FILE=cCompiler

all:
	bison -d $(FILE).y
	flex -o $(FILE).yy.c $(FILE).l
	gcc $(FILE).yy.c $(FILE).tab.c -lfl -o $(FILE).out
	./$(FILE).out < input.txt > output.txt

c:
	rm *.c *.out *.h 

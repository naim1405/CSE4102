FILE=test

all:
	bison -d $(FILE).y
	flex -o $(FILE).yy.c $(FILE).l
	gcc $(FILE).yy.c $(FILE).tab.c -lfl -o $(FILE).out
	#./$(FILE).out < input.txt > output.txt
	./$(FILE).out < input.txt 

c:
	rm *.c *.out *.h 


q1:
	gcc -E q1.c -o q1.i



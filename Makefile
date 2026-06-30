FOLDER=calc
FILE=calc
FILE_PATH=$(FOLDER)/$(FILE)

all:
	bison -d $(FILE_PATH).y -o  $(FILE_PATH).tab.c --header=$(FILE_PATH).tab.h
	flex -o $(FILE_PATH).yy.c $(FILE_PATH).l
	gcc $(FILE_PATH).yy.c $(FILE_PATH).tab.c -lfl -o $(FILE_PATH).out
	#./$(FILE_PATH).out < input.txt > output.txt
	./$(FILE_PATH).out < input.txt > output.txt

c:
	rm $(FOLDER)/*.c $(FOLDER)/*.out $(FOLDER)/*.h 

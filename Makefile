GCC       =  g++
FLAGS	  =  -Wall
SFMLFLAGS =  -lsfml-graphics -lsfml-window -lsfml-system
APPNAME   =  application
SFML_LIB_PATH = C:\SFML\SFML-2.5.1\lib


all:
	mkdir -p bin
	g++ -g main.cpp -o bin/KeyNinja -lsfml-graphics -lsfml-window -lsfml-system
	
windows_build: 
	mkdir -p bin
	g++ -g main.cpp -o bin/KeyNinja -L$(SFML_LIB_PATH) -lsfml-graphics -lsfml-window -lsfml-system

clean:
	rm menu

scene_table_lead.o: data/scene_table_lead.cpp
	$(GCC) -c -o scene_table_lead.o data/scene_table_lead.cpp

main.o: main.cpp
	$(GCC) -c -o main.o main.cpp

app: main.o scene_table_lead.o
	$(GCC) $(SFMLFLAGS) -o $(APPNAME) main.o scene_table_lead.o

run: $(APPNAME)
	 ./$(APPNAME)

menu:
	g++ main.cpp -lsfml-graphics -lsfml-window -lsfml-system -o menu

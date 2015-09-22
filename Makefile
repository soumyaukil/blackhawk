# Blackhawk makefile

CC = g++
CFLAGS = -c -g -Wall -O2

EXEC = blackhawk
SOURCES = $(wildcard src/*.C)
#SOURCES += $(wildcard src/kraken/*.cpp)
OBJECTS = $(SOURCES:.C=.o)

all: EXEC

EXEC: $(OBJECTS)
	$(CC) $(OBJECTS) -o $(EXEC) -lcrypto -ljansson -lcurl -g

%.o: %.cpp
	$(CC) $(CFLAGS) $< -o $@

clearscreen:
	clear

clean:
	rm -rf core $(OBJECTS)

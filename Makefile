# Top-level Makefile

CC = gcc
CFLAGS = -Wall -g
LDFLAGS = -lcunit

# Directories
SRC_DIR = src
TEST_DIR = test
OBJ_DIR = build

# Files
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
TEST_FILES = $(wildcard $(TEST_DIR)/*.c)

# Targets
all: main

main: $(SRC_FILES)
	$(CC) $(CFLAGS) -o main $(SRC_FILES)

# Target for unit tests
test: $(TEST_FILES)
	$(CC) $(CFLAGS) -o tests $(TEST_FILES) $(SRC_FILES) $(LDFLAGS)
	./tests

clean:
	rm -f main tests $(OBJ_DIR)/*.o

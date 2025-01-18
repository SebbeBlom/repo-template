# Top-level Makefile

CC := gcc
CFLAGS := -Wall -g
LDFLAGS := -lcunit
MEMTEST_FLAGS := --leak-check=full --show-leak-kinds=all --track-origins=yes
SUPP := --suppressions=gc.supp

# Directories
SRC_DIR := src
TEST_DIR := test
OBJ_DIR := bin
TEST_OBJ_DIR := $(TEST_DIR)/bin

# Files
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
TEST_FILES := $(wildcard $(TEST_DIR)/*.c)

# Targets
.PHONY: all
all: main

.PHONY: main
main: $(SRC_FILES)
	$(CC) $(CFLAGS) -o main $(SRC_FILES)

# Target for unit tests
.PHONY: test
test: $(TEST_FILES)
	$(CC) $(CFLAGS) -o $(TEST_OBJ_DIR)/tests $(TEST_FILES) $(SRC_FILES) $(LDFLAGS)
	./$(TEST_OBJ_DIR)/tests

.PHONY: memtest
memtest: $(TEST_FILES)
	$(CC) $(CFLAGS) -o $(TEST_OBJ_DIR)/tests $(TEST_FILES) $(SRC_FILES) $(LDFLAGS)
	valgrind $(MEMTEST_FLAGS) ./$(TEST_OBJ_DIR)/tests

.PHONY: clean
clean:
	rm -rf $(OBJ_DIR)/*.o $(TEST_OBJ_DIR)/*

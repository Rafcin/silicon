# Define the target file
TARGET = rasm

# Define the source file
SRC = rasm.s

# Define the object file
OBJ = $(SRC:.s=.o)

# Define the external object files directory
CS3BEXTERNALS = ../External/cs3b
RAFEXTERNALS = ../External/raf

# Define the flags for debugging
DEBUG_FLAGS = -g

# Define the compile command
CC = as $(DEBUG_FLAGS)

# Define the linking command
LINK = ld -lc -lm -e main

# Define the build rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(LINK) -o $(TARGET) $(OBJ) $(CS3BEXTERNALS)/*.o $(RAFEXTERNALS)/*.o

%.o: %.s
	$(CC) -o $@ $<

# Define the clean rule
clean:
	rm -f $(TARGET) $(OBJ)
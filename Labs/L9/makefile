# Define the target file
TARGET = lab

# Define the source file
SRC = lab.s

# Define the object file
OBJ = $(SRC:.s=.o)

# Define the external object files directory
EXTERNALS = ../External

# Define the flags for debugging
DEBUG_FLAGS = -g

# Define the compile command
CC = as $(DEBUG_FLAGS)

# Define the linking command
# Set entry point as main (GDB remote debug)
LINK = ld -lc -lm -e main

# Define the build rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(LINK) -o $(TARGET) $(OBJ) $(EXTERNALS)/*.o

%.o: %.s
	$(CC) -o $@ $<

# Define the clean rule
clean:
	rm -f $(TARGET) $(OBJ)
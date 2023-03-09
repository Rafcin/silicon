# Define the target file
TARGET = fact

# Define the source file
SRC = fact.s

# Define the object file directory
OBJ_DIR = ../

# Define the object file
OBJ = $(OBJ_DIR)/$(SRC:.s=.o)

# Define the flags for debugging
DEBUG_FLAGS = -g

# Define the compile command
CC = as $(DEBUG_FLAGS)

# Define the linking command
LINK = ld -lc -lm -e fact

# Define the build rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(LINK) -o $(TARGET) $(OBJ)

$(OBJ_DIR)/%.o: %.s
	$(CC) -o $@ $<

# Define the clean rule
clean:
	rm -f $(TARGET) $(OBJ)
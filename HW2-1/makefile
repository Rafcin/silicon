# Define the target file
TARGET = segment

# Define the source file
SRC = segment.s

# Define the object file
OBJ = $(SRC:.s=.o)

# Define the flags for debugging
DEBUG_FLAGS = -g

# Define the compile command
CC = as $(DEBUG_FLAGS)

# Define the linking command
LINK = ld

# Define the build rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(LINK) -o $(TARGET) $(OBJ)

%.o: %.s
	$(CC) -o $@ $<

# Define the clean rule
clean:
	rm -f $(TARGET) $(OBJ)
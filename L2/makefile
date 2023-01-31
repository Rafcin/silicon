# Define the target file
TARGET = Add

# Define the source file
SRC = Add.s

# Define the object file
OBJ = $(SRC:.s=.o)

# Define the external object files directory
EXTERNALS = ../External

# Define the flags for debugging
DEBUG_FLAGS = -g

# Define the compile command
CC = as $(DEBUG_FLAGS)

# Define the linking command
LINK = ld

# Define the build rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(LINK) -o $(TARGET) $(OBJ) $(EXTERNALS)/*.o

%.o: %.s
	$(CC) -o $@ $<

# Define the clean rule
clean:
	rm -f $(TARGET) $(OBJ)
TARGET=clox
CC=clang
CPPFLAGS= -MMD
CFLAGS= -g -Wall

SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)
DEPS=$(OBJS:.o=.d)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $^ -o $@

# This are implicit rules, but i like things to be explicit
%.o: %.c
	$(CC) $^ -c $(CPPFLAGS) $(CFLAGS)

clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean

-include $(DEPS)

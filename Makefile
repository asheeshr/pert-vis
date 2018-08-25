CFLAGS := --std=c11

OBJ_DIR := obj
SOURCES := $(wildcard *.c) $(wildcard src/*.c) $(wildcard src/tests/*.c)
OBJECTS := $(patsubst %.c, $(OBJ_DIR)/%.o, $(notdir $(SOURCES)))

TEST := $(patsubst %.c, $(OBJ_DIR)/%.o, $(notdir $(wildcard src/tests/*.c)))

TARGET  := $(OBJ_DIR)/main
APP_DIR := bin
APP     := $(APP_DIR)/pert-vis

.DEFAULT_GOAL := all

## Build Targets

$(OBJECTS) : $(SOURCES)
	$(CC) -c $(CFLAGS) -o $@ $<

$(TARGET): $(OBJECTS)

$(APP) : $(TARGET)
	mkdir -p $(APP_DIR)
	mv $< $@

all: $(APP)

## Util Targets

# TODO: Test this target
test: all
	$(TESTS)

clean:
	@rm -f $(OBJECTS)

## Debug targets

print-srcs:
	@echo $(SOURCES)

print-objs:
	@echo $(OBJECTS)
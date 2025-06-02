V=1
SOURCE_DIR=src
BUILD_DIR=build
include $(N64_INST)/include/n64.mk

all: pong.z64
.PHONY: all

OBJS = $(BUILD_DIR)/main.o

pong.z64: N64_ROM_TITLE="Pong"

$(BUILD_DIR)/pong.elf: $(OBJS)

-include $(wildcard $(BUILD_DIR)/*.d)

# Added by me:
# -------------------------------------------------------------------------------------- #

REFERENCE_DIR = reference

REFERENCE_SRCS = $(wildcard $(SOURCE_DIR)/*.c)
REFERENCE_ASMS = $(patsubst $(SOURCE_DIR)/%.c,$(REFERENCE_DIR)/%.s,$(REFERENCE_SRCS))
REFERENCE_FLAGS = -S -fno-dwarf2-cfi-asm -fverbose-asm -fno-inline -fno-builtin -O0

reference: $(REFERENCE_ASMS)
.PHONY: reference

$(REFERENCE_DIR)/%.s: $(SOURCE_DIR)/%.c
	@mkdir -p $(dir $@)
	@echo "    [GEN ASM] $< -> $@"
	$(N64_CC) $(N64_CFLAGS) $(REFERENCE_FLAGS) -o $@ $<

# -------------------------------------------------------------------------------------- #

clean:
	rm -f $(BUILD_DIR)/* $(REFERENCE_DIR)/* *.z64
.PHONY: clean


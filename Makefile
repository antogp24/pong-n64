V=1
D=1
SOURCE_DIR=src
BUILD_DIR=build
include $(N64_INST)/include/n64.mk

all: pong.z64
.PHONY: all

OBJS = $(BUILD_DIR)/main.o

pong.z64: N64_ROM_TITLE="Pong"

$(BUILD_DIR)/pong.elf: $(OBJS)

-include $(wildcard $(BUILD_DIR)/*.d)

# Reference Assembly
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

# Pong in assembly
# -------------------------------------------------------------------------------------- #

asm: asm-pong.z64
.PHONY: asm

ASM_OBJS = $(BUILD_DIR)/pong.o
ASM_FLAGS = -g -gdwarf-4 -mtune=vr4300 -march=vr4300 -I$(N64_INCLUDEDIR)

asm-pong.z64: N64_ROM_TITLE="Pong in Assembly"
$(BUILD_DIR)/asm-pong.elf: $(ASM_OBJS)

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.s
	@mkdir -p $(dir $@)
	@echo "    [AS] $<"
	$(N64_AS) $(ASM_FLAGS) -o $@ $<

# -------------------------------------------------------------------------------------- #

clean:
	rm -f $(BUILD_DIR)/* $(REFERENCE_DIR)/* *.z64
.PHONY: clean


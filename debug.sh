gdb-multiarch -silent ./build/asm-pong.elf -ex "target remote [::1]:9123" -ex "set step-mode on"

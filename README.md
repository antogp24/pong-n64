# Pong N64
---

Pong for the Nintendo 64 originally written in C and ported by hand to MIPS Assembly.
This project uses the [libdragon](https://libdragon.dev/) library, but only a very small set of functions from it.

## Important Source Files
---

- [src/main.c](./src/main.c): This is where I quickly wrote the game first.
- [reference/main.s](./reference/main.s): This is the generated Assembly of the C source code, to help me when I got stuck. It was **only** used to figure out how to correctly call [libdragon](https://libdragon.dev/)'s functions.
- [src/pong.s](./src/pong.s): This is the **Handwritten Assembly**, which behaves a little different to the C version. As a result, it is a lot smaller than the generated Assembly and the code is a lot cleaner.

## Video Demo in a Simulator
---

I don't have a Nintendo 64 to try it on, so the code was tested on the [Ares](https://ares-emu.net/) simulator, in both the C version and the Assembly version.

> [!WARNING]
> The Assembly version is UNFINISHED. Displaying the scores is missing.

![Unfinished Assembly Version Video](./videos/pong-asm-unfinished.mp4)

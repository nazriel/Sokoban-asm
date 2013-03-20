all:
	nasm -f elf64 main.asm
	nasm -f elf64 gl.asm
	nasm -f elf64 sdl.asm

	ld main.o gl.o sdl.o -m elf_x86_64 -lc -lGL -lGLU -lSDL -o sokoban
test: all
	./sokoban
	

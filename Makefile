all:
	nasm -g -f elf64 main.asm
	nasm -g -f elf64 gl.asm
	nasm -g -f elf64 sdl.asm
	nasm -g -f elf64 map.asm
	gcc main.o gl.o sdl.o map.o -lGL -lGLU -lSDL -o sokoban
test: all
	./sokoban
	

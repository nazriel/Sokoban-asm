all:
	nasm -f elf64 main.asm
	nasm -f elf64 gl.asm
	nasm -f elf64 sdl.asm
	nasm -f elf64 map.asm
	gcc main.o gl.o sdl.o map.o -lGL -lGLU -lSDL -o sokoban
test: all
	./sokoban
	

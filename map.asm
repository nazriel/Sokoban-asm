;;
;; Title: 	Wanna be sokoban
;; Copyright:	2013 Damian Ziemba
;; Authors:	Damian Ziemba <nazriel@dzfl.pl>
;; License: 	GPL
;;

[bits 64]

global loadMap
extern fopen
extern fgets
extern fprintf
extern fclose
extern feof
extern printf

section .text

; *filename is passed in the RDI
loadMap:
	mov RBP, RSP
	mov RSI, openMode
	call fopen
	and RAX, RAX
	jz openError
	
	mov RCX, 16
	sub RSP, 32
	mov [fd], RAX

	loop:
		lea RAX, [RBP-32]
		mov RDI, RAX
		mov RSI, 32
		mov RDX, [fd]
		push RCX
		call fgets
		
		call feof
		pop RCX
		and RAX, RAX
		jnz eofError
		
		; cos tu zjebalem... tylko co hm
		mov RBX, 16
		loop2:
			mov RAX, RBX
			mul RCX
			sub RAX, 32
			mov R8, RBP
			sub R8, RAX
			
			push RDI
			push RSI

			mov RDI, fmt
			movzx RSI, byte R8
			push RCX
			push RBX
			call printf
			pop RBX
			pop RCX
			pop RSI
			pop RDI

			dec RBX
			and RBX, RBX
			jnz loop2
	
		loop loop
		

	mov RAX, 1
	add RSP, 32
	ret 

openError:
	;mov RDX, RDI
	mov RDI, openErrorFmt
	call printf
	mov RAX, 0
	ret	

eofError:
	mov RDI, 2
	mov RSI, eofErrorFmt
	call fprintf
	mov RAX, 0
	ret

section .data
	map:		times 16*16 	dd -1
	openErrorFmt: 			db "Error: couldn't open map file", 0xA, 0
	eofErrorFmt:			db "Error: unexpected end of file", 0xA, 0
	fd:				db 0
	fmt:				db "Current char: %c", 0xA, 0
	openMode:			db "r", 0

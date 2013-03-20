;;
;; Title: 	Wanna be sokoban
;; Copyright:	2013 Damian Ziemba
;; Authors:	Damian Ziemba <nazriel@dzfl.pl>
;; License: 	GPL
;;

[bits 64]

; exports
global initSDL
global handleEvent

; imports - program
extern screenWidth
extern screenHeight
extern gameTitle
extern keys

; imports - sdl
extern SDL_Init
extern SDL_SetVideoMode
extern SDL_EnableKeyRepeat
extern SDL_WM_SetCaption
extern SDL_PollEvent

; imports - libc
extern printf

section .text
[bits 64]

initSDL:
	;SDL_Init
	mov RDI, 0x20	; InitVideo
	call SDL_Init
	
	;SDL_SetVideoMode
	mov RCX, 0x2	; openGL
	mov RDX, 24	; 24bpp 
	mov RSI, screenHeight
	mov RDI, screenWidth
	call SDL_SetVideoMode

	;SDL_EnableKeyRepeat
	mov RSI, 30
	mov RDI, 500
	call SDL_EnableKeyRepeat
	
	;SDL_SetCaption
	mov RSI, 0
	mov RDI, gameTitle
	call SDL_WM_SetCaption

	ret

quitSDL:

handleEvent:
	mov RBP, RSP
	sub RSP, 0x20 ; SDL_Event [ RBP + 24 ]
	

	loop:
		lea RAX, [RBP-0x20]
		mov RDI, RAX
		call SDL_PollEvent
		and RAX, RAX
		jz true 

		movzx RAX, byte [RBP-0x20]	
		cmp RAX, 0x2
		je handleKeyDown
		jmp loop
	false:
		add RSP, 0x20
		xor RAX, RAX
		ret
	true:
		add RSP, 0x20
		mov RAX, 1
		ret
	
handleKeyDown:
	add RSP, 0x20
	mov RDI, fmt
	call printf
	ret

section .data
	;event:		dq 	0
	fmt:		db 	"Key down", 0xA, 0

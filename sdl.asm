;;
;; Title: 	Wanna be sokoban
;; Copyright:	2013 Damian Ziemba
;; Authors:	Damian Ziemba <nazriel@dzfl.pl>
;; License: 	GPL
;;

[bits 64]

; exports
global initSDL

; imports - program
extern screenWidth
extern screenHeight
extern gameTitle

; imports - sdl
extern SDL_Init
extern SDL_SetVideoMode
extern SDL_EnableKeyRepeat
extern SDL_WM_SetCaption

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

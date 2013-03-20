;;
;; Title: 	Wanna be sokoban
;; Copyright:	2013 Damian Ziemba
;; Authors:	Damian Ziemba <nazriel@dzfl.pl>
;; License: 	GPL
;;

[bits 64]

; exports
global main
global screenWidth
global screenHeight
global screenFull
global screenRatio
global gameTitle
global keys

; imports - program
extern initOpenGL
extern initSDL
extern handleEvent

; imports - libc
extern exit

section .data
	screenWidth: 	equ 1024
	screenHeight: 	equ 768
	screenFull:	equ 0
	screenRatio: 	equ screenWidth/screenHeight
	gameTitle:	db "Wanna be sokoban", 0
	keys:		times 323 db 0

section .text
main:
	call initSDL
	call initOpenGL
events:
	call handleEvent
	and RAX, RAX
	jnz events
	
	mov RDI, 0
	call exit

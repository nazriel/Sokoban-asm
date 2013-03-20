;;
;; Title: 	Wanna be sokoban
;; Copyright:	2013 Damian Ziemba
;; Authors:	Damian Ziemba <nazriel@dzfl.pl>
;; License: 	GPL
;;

[bits 64]

; exports
global _start
global screenWidth
global screenHeight
global screenFull
global screenRatio
global gameTitle

; imports - program
extern initOpenGL
extern initSDL

; imports - libc
extern exit

section .data
	screenWidth: 	equ 1024
	screenHeight: 	equ 768
	screenFull:	equ 0
	screenRatio: 	equ screenWidth/screenHeight
	gameTitle:	db "Wanna be sokoban", 0

section .text
_start:
	call initSDL
	call initOpenGL
	mov RCX, 0x500000000
loop:
	loop loop

	mov RDI, 0
	call exit
	;ret

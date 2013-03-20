;;
;; Title: 	Wanna be sokoban
;; Copyright:	2013 Damian Ziemba
;; Authors:	Damian Ziemba <nazriel@dzfl.pl>
;; License: 	GPL
;;

[bits 64]

; exports
global initOpenGL

; imports - program
extern screenHeight
extern screenWidth
extern screenRatio

; imports - GL
extern glShadeModel
extern glClearColor
extern glViewPort
extern glMatrixMode
extern glLoadIdentity
extern glHint

; imports - GLU
extern gluPerspective

section .text

initOpenGL:
	;glShadeModel
	mov RDI, GL_SMOOTH
	call glShadeModel

	;glClearColor
	mov RCX, 0
	mov RDX, 0
	mov RSI, 0
	mov RDI, 0
	call glClearColor

	;glViewPort
	mov RCX, screenHeight
	mov RDX, screenWidth
	mov RSI, 0
	mov RDI, 0
	
	;glMatrixMode
	mov RDI, GL_PROJECTION
	call glMatrixMode

	;glLoadIdentity
	call glLoadIdentity

	;gluPerspective
	mov RCX, 1024
	mov RDX, 1
	mov RSI, screenRatio
	mov RDI, 60
	call gluPerspective

	;glHint
	mov RSI, GL_NICEST
	mov RDI, GL_PERSPECTIVE_CORRECTION_HINT
	call glHint

	mov RAX, 1

	ret

section .data
	GL_SMOOTH: 		equ 0x1D01
	GL_PROJECTION:		equ 0x1701 
	GL_PERSPECTIVE_CORRECTION_HINT equ 0x0C50
	GL_NICEST		equ 0x1102


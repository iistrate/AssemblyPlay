title bingley4

dosseg
  .model small
  include CONSOLE.inc
  .stack 50h
  .386
  .data
	INPUT db 'INPUT NUMBER:', '$'
	FOUNDNR db 'FOUND NUMBER AT:', '$'
	NOTFOUND db 'NUMBER NOT FOUND.', '$'

	;array
    ARRAY db 2, 4, 6, 8, 10, 12, 14, 16, 19, 23, 26, 27, 29, 32, 33, 35, 36, 43, 54, 57, 59, 63, 66, 69, 72, 79, 82
	HOWMANY dw $-ARRAY
	ARRAYOFFSET db ?

  .code
    first proc
     mov ax,@data
     mov ds,ax
			
	MAIN:
	call crlf
	mov ah, 9
	mov dx, offset INPUT
	int 21h
	
	mov cx, HOWMANY
	mov bx, offset ARRAY
	mov di, 0
	call readint
	cmp ax, 0
	je WOOHOO
	mov ah, 0
	mov di, 0
	top:
		cmp al, [bx+di]
		mov ARRAYOFFSET, ah
		je FINDLABEL
		inc ah
		inc bx
	loop top
	call crlf
	mov ah, 9
	mov dx, offset NOTFOUND
	int 21h
	jmp MAIN
			
	FINDLABEL:
	call crlf
	mov ah, 9
	mov dx, offset FOUNDNR
	int 21h
	mov al, ARRAYOFFSET
	mov ah, 0
	call writeint
	jmp MAIN

	WOOHOO:
     mov ax, 4c00h
     int 21h

    first endp
    end  first

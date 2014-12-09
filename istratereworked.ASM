title bingley5

dosseg
  .model small
  include CONSOLE.inc
  .stack 50h
  .386
  .data

	info1 db 'BASE:', '$'
	info2 db 'EXP:', '$'
	final db 'EQUALS:', '$'
	
	BASE DB ?
	EXPON DB ?
	RESULT DW ?
	EXPARM DW BASE, EXPON, RESULT

  .code
    first proc
     mov ax,@data
     mov ds,ax

	MAIN:
	call crlf
	mov ah, 9
	mov dx, offset info1
	int 21h	
	call readint
	mov BASE, al

	cmp ax, 0
	JE WOHOO

	call crlf			
	mov ah, 9
	mov dx, offset info2
	int 21h
	call readint
	mov EXPON, al
	cmp ax, 0


	JE WOHOO
	
	
	;getting business done yeeehawwwwwwwww
	mov bx, offset EXPARM
	call power


	;RESULT
	call crlf
	mov ah, 9
	mov dx, offset final
	int 21h
	mov ax, RESULT
	call writeint

	JMP MAIN
	WOHOO:
	;go outside and play


     mov ax, 4c00h
     int 21h

    first endp
	POWER proc
		pushf
			mov si, [bx]
			mov al, [si]
			mov dl, [si]
			mov si, 2[bx]
			mov cl, [si]
			dec cl
			loopy:
				mul dl
			loop loopy
			mov RESULT, ax
		popf
		ret
	POWER endp
    end  first
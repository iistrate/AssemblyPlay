title 

dosseg
  .model small
  .386
  .stack 50h

  .data
	;welcome string
    prompt db 'Hello, please input string; please add 0 at end as a terminator:', 0dh, 0ah, '$'
	;max nr of chars, chars read, initialize to empty
	instring db 11, 0, 12 dup (0)
	strSize db ?
	;parameters
	params dw strSize, instring+1

  .code
    main proc
     mov ax,@data
     mov ds,ax
		
		;begin here
			;print instructions
			mov ah, 9
			mov dx, offset prompt
			int 21h

			;read string
			mov ah, 0ah
			mov dx, offset instring
			int 21h

			;assign string size
			mov cl, instring+1
			mov strSize, cl
			add strSize, 1

			;pass params
			mov bx, offset params		
			call toUpper

			;print

		;end here

     mov ax, 4c00h
     int 21h

    main endp
	;force string to lowercase
	toUpper proc
		pushf
			;move address
			mov si, [bx]
			;move value
			mov cl, [si]
			;print char
			mov ah, 2
			;move address
			mov bx, offset [bx]+2
			top:
				;convert
				mov dx, [bx]
				sub dx, 32d
				int 21h
				call newline
				inc bx
			loop top
		popf
		ret
	toUpper endp 

	newLine proc
		;new line
		mov dl, 0dh
		int 21h
		mov dl, 0ah
		int 21h
		ret
	newLine endp


    end  main

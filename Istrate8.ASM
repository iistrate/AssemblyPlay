title 

dosseg
  .model small
  .stack 50h

  .data
	;prompt
	prompt db 'INPUT NUMBER: $'
	;array
    ARRAY db 2, 4, 6, 8, 10, 12, 14, 16, 19, 23, 26, 27, 29, 32, 33, 35, 36, 43, 54, 57, 59, 63, 66, 69, 72, 79, 82
	HOWMANY db $-ARRAY
	INPUT db ?
	FOUNDAT db ?

  .code
    main proc
     mov ax,@data
     mov ds,ax
		
		;begin here
			;print instructions
			mov ah, 9
			mov dx, offset prompt
			int 21h

			;read char
			mov ah, 1
			mov dx, offset INPUT
			int 21h

			;find
			mov cl, 0
			mov bx, offset ARRAY
			mov al, INPUT
			begin:
				;if input found exit
				cmp byte ptr [bx], al
				je exit
				;else continue
				cmp HOWMANY, cl
				je exit
				inc cl
				inc bx
			jmp begin
			exit:
			;assign found at
			mov FOUNDAT, cl
			call newline
			mov bx, offset FOUNDAT
			
			;print bx content
			mov ah, 2
			mov dx, [bx] 
			int 21h

			;print

		;end here

     mov ax, 4c00h
     int 21h

    main endp

	;add a newline
	newline proc
		mov dl, 0dh
		int 21h
		mov dl, 0ah
		int 21h
	newline endp

    end  main

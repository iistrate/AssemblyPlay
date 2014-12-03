title 

dosseg
  .model small
  include CONSOLE.inc
  .stack 50h
  .386
  .data
	;prompts
	prompt db 'INPUT NUMBER: $'
	foundprompt db 'FOUND NUMBER AT: $'
	;array
    ARRAY db 2, 4, 6, 8, 10, 12, 14, 16, 19, 23, 26, 27, 29, 32, 33, 35, 36, 43, 54, 57, 59, 63, 66, 69, 72, 79, 82
	HOWMANY dw $-ARRAY
	FOUNDAT db ?

  .code
    main proc
     mov ax,@data
     mov ds,ax
		;begin here
			
			;main loop
			SENTINEL:
			;newline
			call crlf
			;print instructions
			mov ah, 9
			mov dx, offset prompt
			int 21h
			
			;user input
			call readint
			;if 0 exit
			cmp ax, 0
			JE FINISH

			;else see if in array
			mov cx, HOWMANY
			mov bx, offset ARRAY
			mov ah, 0
			top:
				cmp byte ptr al, [bx]
				mov FOUNDAT, ah
				JE FOUND
				inc bx
				inc ah
			loop top

			JMP SENTINEL
			
			FOUND:
			;newline
			call crlf
			;print found at
			mov ah, 9
			mov dx, offset foundprompt
			int 21h
			mov al, FOUNDAT
			mov ah, 0
			call writeint

			FINISH:

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

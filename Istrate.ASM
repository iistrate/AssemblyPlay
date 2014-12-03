title 

dosseg
  .model small
  include CONSOLE.inc
  .stack 50h
  .386
  .data
	;prompts
	basePrompt db 'Enter base or 0 to exit: $'
	expPrompt db 'Enter exp or 0 to exit: $'
	resultPrompt db 'Result is: $'
	
	;setup
	BASE db ?
	EXPON db ?
	RESULT dw ?
	PARM dw BASE, EXPON, RESULT

  .code
    main proc
     mov ax,@data
     mov ds,ax
		;begin here	
			;main loop
			SENTINEL:

			;newline
			call crlf
			;print instructions for base
			mov ah, 9
			mov dx, offset basePrompt
			int 21h
			
			;user input for base
			call readint
			mov BASE, al

			;if 0 exit
			cmp ax, 0
			JE FINISH

			;newline
			call crlf			
			;print instructions for base
			mov ah, 9
			mov dx, offset expPrompt
			int 21h

			;user input for exponent
			call readint
			mov EXPON, al


			;if 0 exit
			cmp ax, 0
			JE FINISH

			;send parameters and call power
			mov bx, offset PARM
			call power

			;newline
			call crlf
			;print instructions for base
			mov ah, 9
			mov dx, offset resultPrompt
			int 21h
			mov ax, RESULT
			call writeint

			JMP SENTINEL

			FINISH:

		;end here

     mov ax, 4c00h
     int 21h

    main endp
	
	;power
	power proc
		pushf
			;we have parameters in bx
			;point to base
			mov si, [bx]
			mov al, [si]
			mov dl, [si]
			mov ah, 0
			;point to expon
			mov si, [bx]+2
			mov cl, [si]
			dec cl
			;point to result
			mov si, [bx]+4
			MULTIPLY:
				mul dl
			loop MULTIPLY
			mov [si], ax
		popf
		ret
	power endp

	;add a newline
	newline proc
		mov dl, 0dh
		int 21h
		mov dl, 0ah
		int 21h
		ret
	newline endp

    end  main

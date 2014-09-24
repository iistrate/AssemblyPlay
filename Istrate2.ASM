title Given array sum content

dosseg
  .model small
  .stack 50h

  .data
    ARRAY DB 20,19,18,1
	SUM DB 0

  .code
    main proc
     mov ax,@data
     mov ds,ax
		
		;begin here

		;jumps pass the loop
		jmp next
		back:
		;loop setup
		MOV cx, 4
		MOV bx, offset ARRAY
		MOV al, 0
		top:
			ADD al,[bx]
			INC bx
		loop top
		MOV SUM, al
		;avoids infinite jumping 
		jmp past
		next: INC SUM
		;jumps behind loop
		jmp back
		past:
		;end here

     mov ax, 4c00h
     int 21h

    main endp
    end  main

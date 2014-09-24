title Given array 4,3,2,1 reverse and move into rarray

dosseg
  .model small
  .stack 50h

  .data
    ARRAY DW 4,3,2,1
	;init rarray size 4 all 0
	RARRAY DW ?,?,?,? ;4 DUP (0)

  .code
    main proc
     mov ax,@data
     mov ds,ax
		
		;begin here, first push everything into stack, then pop will reverse order
		
		mov cx, ARRAY
		;move 0 into di register
		mov di, 0
		;move first number's address into bx register
		mov bx, offset ARRAY
		loopPUSH:
			;push numbers onto stack starting with a displacement of 2
			PUSH [bx + di]
			;everytime we loop increment di by 2
			add di, 2
		loop loopPUSH

		mov cx, ARRAY
		mov di, 0
		mov bx, offset RARRAY
		loopPOP:
			;pop numbers into array
			POP [bx + di]
			add di, 2
		loop loopPOP

		;end here

     mov ax, 4c00h
     int 21h

    main endp
    end  main

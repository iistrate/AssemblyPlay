title Given array 2,4,6,8,9 sum array

dosseg
  .model small
  .stack 50h

  .data
    ARRAY dw 1,2,3,4
	SUM dw ?
  .code
    main proc
     mov ax,@data
     mov ds,ax
		
		;begin here, first push everything into stack, then pop will reverse order

		mov cx, 4
		mov bx, offset ARRAY
		mov ax, 0
		mov cx, 0
		sumloop:
			add ax, ARRAY[cx]
			inc cx
		loop sumloop
		mov SUM, ax
		
		;end here

     mov ax, 4c00h
     int 21h

    main endp
    end  main

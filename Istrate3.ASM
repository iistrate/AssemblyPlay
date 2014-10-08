title Given array 2,4,6,8,9 sum array

dosseg
  .model small
  .stack 50h

  .data
    ARRAY db 1,2,3,4
	SUM db 4
  .code
    main proc
     mov ax,@data
     mov ds,ax
		
		;begin here, first push everything into stack, then pop will reverse order

		mov cx, 4
		mov al, 0
		mov si, 0
		
		sumloop:
			add al, ARRAY[si]
			inc si
		loop sumloop

		mov SUM, al
		
		;end here

     mov ax, 4c00h
     int 21h

    main endp
    end  main

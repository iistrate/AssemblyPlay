title find first 15 fibonacci numbers

dosseg
  .model small
  .stack 50h

  .data
	;allocate 15 elements to array
    mArray db 1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	;store size of array
	mSize db $-mArray
  .code
    main proc
     mov ax,@data
     mov ds,ax
		
		;begin here

		;how many times to loop
		mov cl, mSize
		;start looping from address of array + 2
		mov bx, offset mArray+2
		top:
			;do the fibo dance
			mov al, [bx-1]
			add al, [bx-2]
			;assign the fibonacci nr to our array
			mov [bx], al
			inc bx
		loop top

		;end here

     mov ax, 4c00h
     int 21h

    main endp
    end  main

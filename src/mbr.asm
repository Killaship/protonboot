bits 16
org 0x7c00

mov ax, 07C0h   ; Set 'ax' equal to the location of this bootloader divided by 16
add ax, 20h     ; Skip over the size of the bootloader divided by 16
mov ss, ax      ; Set 'ss' to this location (the beginning of our stack region)
mov ax, 07C0h   ; Set 'ax' equal to the location of this bootloader divided by 16
mov ds, ax      ; Set 'ds' to the this location

mov si, text	; Put address of the null-terminated string to output into 'si'
call print      ; Call our string-printing routine
call halt

halt:
  cli
  hlt
  jmp halt

print:
	mov ah, 0Eh   ; Specify 'int 10h' 'teletype output' function
	mov bl, 0Bh   ; [AL = Character, BH = Page Number, BL = Colour (in graphics mode)]
.printchar:
	lodsb           ; Load byte at address SI into AL, and increment SI
	cmp al, 0
	je .done        ; If the character is zero (NUL), stop writing the string
	int 10h         ; Otherwise, print the character via 'int 10h'
	jmp .printchar  ; Repeat for the next character
.done:
  ret
  

text db 'Yay, it booted!', 0


times 510-($-$$) db 0
dw 0xAA55 

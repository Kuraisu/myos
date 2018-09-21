[org 0x7c00] ; bootsector offset

; The main routine makes sure the parameters are ready and then calls the function
mov bx, HELLO
call print

call print_nl

mov bx, GOODBYE
call print

call print_nl

mov dx, 0x12fe
call print_hex

; that's it! we can hang now
jmp $ ; jump to current address = infinite loop

; including subroutines below the hang
%include "boot_print.asm"
%include "boot_print_hex.asm"

; data
HELLO:
    db 'Hello, World', 0

GOODBYE:
    db 'Goodbye', 0

; Fill with 510 zeros minus the size of the previous code
times 510 - ($-$$) db 0
; Magic number
dw 0xaa55

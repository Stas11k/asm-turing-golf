.MODEL tiny
.CODE
ORG 100h

start:
    ; Write "HELLO" to stdout
    mov ah, 40h         ; DOS: Write to file/device
    mov bx, 1           ; stdout handle
    mov cx, 5           ; 5 bytes
    mov dx, offset msg
    int 21h

    mov ah, 4Ch         ; DOS: Terminate
    int 21h

msg db 'HELLO'

END start

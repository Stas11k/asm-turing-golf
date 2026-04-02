.MODEL tiny
.CODE
ORG 100h

start:
    mov si, 81h

skip_spaces:
    lodsb
    cmp al,' '
    je skip_spaces
    lea dx, [si-1]

find_end:
    lodsb
    cmp al, 0Dh
    jne find_end
    mov byte ptr [si-1], 0

    mov ah, 3Dh
    int 21h
    xchg ax, bx
    mov ah, 3Fh
    mov ch, 7Dh
    mov dx, offset file_buf
    int 21h
    xchg ax, di
    mov byte ptr [file_buf + di], 0

    mov ah, 4Ch
    int 21h

file_buf label byte

END start
.MODEL tiny
.CODE
ORG 100h

start:
    mov si, 81h

skip_spaces:
    lodsb
    cmp al,' '
    jbe skip_spaces
    lea dx, [si-1]

find_end:
    lodsb
    cmp al, 13
    jne find_end
    mov [si-1], bh

    mov ax, 3D00h
    int 21h
    xchg ax, bx
    mov ah, 3Fh
    mov ch, 7Dh
    mov dx, offset file_buf
    int 21h
    xchg ax, di
    mov [file_buf + di], bh

    mov si, offset file_buf
    mov di, offset start_id

parse_main:
    lodsb
    test al, al
    jz done
    cmp al, ';'
    je skip_l
    cmp al, 32
    jbe parse_main
    cmp al, '-'
    je done
    dec si

parse_line_tokens:
    call get_token_to_di
    inc di
    
    mov al, [si]
    cmp al, 13
    ja parse_line_tokens
    jmp parse_main

skip_l:
    lodsb
    test al, al
    jz done
    cmp al, 10
    jne skip_l
    jmp parse_main

get_token_to_di:
    xor cx, cx

gt_skip:
    lodsb
    cmp al, 32
    jbe gt_skip
    cmp al, '_'
    jne gt_loop
    xor al, al
    
gt_loop:
    add cl, al
    rol cl, 1
    lodsb
    cmp al, 32
    ja gt_loop
    mov [di], cl
    ret

done:
    ret

start_id  db ?
halt_id   db ?
rules_data label byte
file_buf  equ start_id + 3000

END start
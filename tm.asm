.MODEL tiny
.CODE
ORG 100h

start:
    mov si, 81h

skip_spaces:
    lodsb
    cmp al, 32
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
    jz load_tape_init
    cmp al, ';'
    je skip_l
    cmp al, 32
    jbe parse_main
    cmp al, '-'
    je find_tape_start
    dec si

parse_line_tokens:
    xor cx, cx
    xor dx, dx

gt_skip:
    lodsb
    cmp al, 32
    jbe gt_skip
    cmp al, '_'
    jne gt_loop
    xor al, al

gt_loop:
    mov bl, al
    inc dx
    add cl, al
    rol cl, 1
    lodsb
    cmp al, 32
    ja gt_loop
    xchg ax, cx
    cmp dx, 1
    jne store_token
    mov al, bl
    cmp al, 'L'
    je is_l
    cmp al, 'R'
    jne store_token
    mov al, 1
    jmp store_token

is_l:
    mov al, 0FFh

store_token:
    stosb
    xchg ax, cx
    cmp al, 13
    ja parse_line_tokens
    jmp parse_main

skip_l:
    lodsb
    cmp al, 10
    jne skip_l
    jmp parse_main

find_tape_start:
    lodsb
    cmp al, 10
    jne find_tape_start

load_tape_init:
    mov di, 8000h

copy_tape_loop:
    lodsb
    cmp al, 13
    jbe tape_done
    stosb
    jmp copy_tape_loop

tape_done:
    mov [di], bh

    mov al, [start_id]
    mov bx, 8000h

exec_loop:
    cmp al, [halt_id]
    je done
    mov dh, [bx]
    xchg al, dl
    mov si, offset rules_data

find_rule:
    cmp si, offset file_buf
    jae done
    cmp word ptr [si], dx
    je apply_rule
    add si, 5
    jmp find_rule

apply_rule:
    inc si
    inc si
    lodsb
    xchg ax, bp
    lodsw
    mov [bx], al
    mov al, ah
    cbw
    add bx, ax
    xchg ax, bp
    jmp exec_loop

done:
    ret

start_id  db ?
halt_id   db ?
rules_data label byte
file_buf  equ start_id + 3000

END start
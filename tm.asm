.MODEL tiny
.CODE
ORG 100h

start:
    mov di, 8000h - 10000
    mov cx, 20001
    rep stosb
    mov si, 81h
skip_spaces:
    lodsb
    cmp al, 32
    jbe skip_spaces
    dec si
    mov dx, si

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
    or al, al
    jz no_tape
    cmp al, ';'
    je skip_l
    cmp al, 32
    jbe parse_main
    cmp al, '-'
    je skip_t
    dec si

parse_tok:
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
    dec dx
    jne store
    mov al, bl
    cmp al, 'R'
    je is_r
    cmp al, 'L'
    jne store
    mov al, 0FFh
    jmp store

is_r:
    mov al, 1

store:
    stosb
    xchg ax, cx
    or al, al
    jz no_tape
    cmp al, 13
    ja parse_tok
    jmp parse_main

skip_l:
    lodsb
    cmp al, 10
    jne skip_l
    jmp parse_main

skip_t:
    lodsb
    cmp al, 10
    jne skip_t

load_tape_init:
    mov bx, 8000h
    mov di, bx

copy_t:
    lodsb
    cmp al, 13
    jbe t_done
    stosb
    jmp copy_t

no_tape:
    mov bp, di
    mov bx, 8000h

t_done:
    mov [di], bh
    mov ax, word ptr [start_id]

exec:
    cmp al, ah
    je done
    xchg al, dl
    mov dh, [bx]
    mov si, offset rules_data

find_r:
    cmp si, bp
    jae done
    cmp word ptr [si], dx
    je appl
    add si, 5
    jmp find_r

appl:
    mov ax, [si+3]
    mov [bx], al
    xchg al, ah
    cbw
    add bx, ax
    mov al, [si+2]
    jmp exec

done:
    mov si, 8000h - 10000
    mov cx, 20001

find_left:
    lodsb
    test al, al
    jnz found_left
    loop find_left
    jmp exit_prog

found_left:
    dec si
    mov dx, si
    mov di, 8000h + 10000
    mov cx, 20001
    std

find_right_loop:
    mov al, [di]
    test al, al
    jnz found_right
    dec di
    loop find_right_loop

found_right:
    cld
    mov si, dx

print_loop:
    lodsb
    test al, al
    jnz check_printable
    mov al, 32
    jmp do_print

check_printable:
    cmp al, 32
    jb skip_char
    cmp al, 126
    ja skip_char

do_print:
    mov ah, 02h
    mov dl, al
    int 21h

skip_char:
    cmp si, di
    jbe print_loop

exit_prog:
    ret

start_id  db ?
halt_id   db ?
rules_data label byte
file_buf  equ start_id + 3000

END start
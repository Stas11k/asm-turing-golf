.MODEL tiny
.CODE
ORG 100h

start:
    mov di, 8000h - 10000
    mov cx, 20001
    rep stosb
    mov si, 80h
    lodsb
    xchg ax, bx
    mov [bx+si], bh
    inc si
    mov dx, si

    mov ah, 3Dh
    int 21h
    xchg ax, bx
    mov ah, 3Fh
    mov ch, 7Dh
    mov dx, offset file_buf
    int 21h
    xchg ax, di
    mov [file_buf + di], bh

    mov bx, 8000h
    xchg si, dx
    mov di, offset start_id

parse_main:
    lodsb
    or al, al
    jz t_done
    cmp al, ';'
    je skip_l
    cmp al, 32
    jbe parse_main
    cmp al, '-'
    jne p_tok
    mov di, bx

skip_l:
    lodsb
    cmp al, 10
    ja skip_l
    jnz t_done
    cmp di, bx
    jne parse_main

copy_t:
    lodsb
    cmp al, 13
    jbe t_done
    stosb
    jmp copy_t

p_tok:
    dec si

parse_tok:
    xor cx, cx

gt_skip:
    lodsb
    cmp al, 32
    jbe gt_skip
    cmp al, '_'
    jne gt_loop
    xor al, al

gt_loop:
    shl cx, 4
    add cl, al
    adc ch, dh
    lodsb
    cmp al, 32
    ja gt_loop
    xchg ax, cx

store:
    stosw
    xchg ax, cx
    or al, al
    jz t_done
    cmp al, 13
    ja parse_tok
    jmp parse_main

t_done:
    mov cx, [start_id]

exec:
    cmp cx, [halt_id]
    je done
    mov dl, [bx]
    xor dh, dh
    mov si, offset rules_data-10

find_r:
    add si, 10
    cmp [si], cx
    jne find_r
    cmp [si+2], dx
    jne find_r

appl:
    mov al, [si+6]
    mov [bx], al
    dec bx
    mov al, [si+8]
    cmp al, 'N'
    jb mv
    inc bx
    cmp al, 'N'
    je mv
    inc bx
mv:
    mov cx, [si+4]
    jmp exec

done:
    mov di, 8000h - 10000
    mov cx, 20001
    xor al, al
    repe scasb
    jz empty
    dec di
    mov dx, di

    mov di, 8000h + 10000
    inc cx
    std
    repe scasb
    inc cx
    push cx
    inc di

fix:
    cmp [di], al
    jnz n_f
    mov byte ptr [di], 32
n_f:
    dec di
    loop fix
    pop cx
    mov ah, 40h
    mov bx, 1
    int 21h
empty:
    ret

start_id  dw ?
halt_id   dw ?
rules_data label byte
file_buf  equ start_id + 3000

END start
.MODEL tiny
.CODE
ORG 100h

start:
    mov di, 8000h - 10000
    mov cx, 20001
    rep stosb
    mov si, 82h
    mov bl, [si-2]
    mov [bx+si-1], bh
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

    mov bh, 80h
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
    xor dx, dx

gt_skip:
    lodsb
    cmp al, 32
    jbe gt_skip
    cmp al, '_'
    jne gt_loop
    xor al, al

gt_loop:
    inc dx
    add cl, al
    rol cl, 1
    lodsb
    cmp al, 32
    ja gt_loop
    xchg ax, cx
    dec dx
    jne store
    ror al, 1

store:
    stosb
    xchg ax, cx
    or al, al
    jz t_done
    cmp al, 13
    ja parse_tok
    jmp parse_main

t_done:
    mov cx, word ptr [start_id]

exec:
    cmp cl, ch
    je done
    xchg cl, dl
    mov dh, [bx]
    mov si, offset rules_data-5

find_r:
    add si, 5
    cmp [si], dx
    jne find_r

appl:
    mov ax, [si+3]
    mov [bx], al
    dec bx
    cmp ah, 'N'
    jb mv
    inc bx
    je mv
    inc bx
mv:
    mov cl, [si+2]
    jmp exec

done:
    mov di, 8000h - 10000
    mov cx, 20001
    xor al, al
    repe scasb
    jz empty
    xchg si, di
    dec si
    mov dx, si

    mov di, 8000h + 10000
    inc cx
    std
    repe scasb
    inc cx
    push cx

fix:
    cmp [si], al
    jnz n_f
    mov byte ptr [si], 32
n_f:
    inc si
    loop fix
    pop cx
    mov ah, 40h
    mov bx, 1
    int 21h
empty:
    ret

start_id  db ?
halt_id   db ?
rules_data label byte
file_buf  equ start_id + 3000

END start
.MODEL tiny
.CODE
ORG 100h

start:
    mov di, 8000h - 10000
    mov cx, 20001
    rep stosb
    mov si, 81h
    mov bl, [si-1]
    mov [bx+si], bh

skip_spaces:
    lodsb
    cmp al, 32
    jbe skip_spaces
    dec si
    mov dx, si

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
    jz t_done
    cmp al, ';'
    je skip_l
    cmp al, 32
    jbe parse_main
    cmp al, '-'
    jne p_tok

skip_t:
    lodsb
    cmp al, 10
    jne skip_t
    mov bx, 8000h

copy_t:
    lodsb
    cmp al, 13
    jbe t_done
    mov [bx], al
    inc bx
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

skip_l:
    lodsb
    cmp al, 10
    jne skip_l
    jmp parse_main

t_done:
    mov bx, 8000h
    mov cx, word ptr [start_id]

exec:
    cmp cl, ch
    je done
    xchg cl, dl
    mov dh, [bx]
    mov si, offset rules_data

find_r:
    cmp si, di
    jae done
    cmp [si], dx
    je appl
    add si, 5
    jmp find_r

appl:
    mov ax, [si+3]
    mov [bx], al
    xchg al, ah
    sub al, 'N'
    je short mv
    sbb al, al
    or  al, 1
mv:
    cbw
    add bx, ax
    mov cl, [si+2]
    jmp exec

done:
    mov di, 8000h - 10000
    mov cx, 20001
    xor al, al
    repe scasb
    jz empty
    dec di
    mov si, di
    mov dx, di

    mov di, 8000h + 10000
    inc cx
    std
    repe scasb
    inc di

fix:
    cmp byte ptr [si], 0
    jnz n_f
    mov byte ptr [si], 32
n_f:
    inc si
    cmp si, di
    jbe fix
    mov cx, si
    sub cx, dx
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
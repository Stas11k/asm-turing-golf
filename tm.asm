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
    cmp al, 13
    jne find_end
    mov byte ptr [si-1], 0

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

find_header:
    lodsb
    test al, al
    jz done
    cmp al, ';'
    je skip_header_line
    cmp al, 32
    jbe find_header
    dec si
    mov di, offset start_name
    call get_token
    mov di, offset halt_name
    call get_token
    jmp find_rules

skip_header_line:
    call skip_line_sub
    jmp find_header

find_rules:
    lodsb
    test al, al
    jz done
    cmp al, 32
    jbe find_rules
    cmp al, ';'
    je skip_rule_line
    cmp al, '-'
    jne skip_rule_line
    cmp word ptr [si], '--'
    je done

skip_rule_line:
    call skip_line_sub
    jmp find_rules

get_token:
    lodsb
    cmp al, 32
    jbe get_token
    
copy_loop:
    stosb
    lodsb
    cmp al, 32
    ja copy_loop
    mov [di], bh
    ret

skip_line_sub:
    lodsb
    test al, al
    jz done_ret
    cmp al, 10
    jne skip_line_sub
done_ret:
    ret

done:
    mov ah, 4Ch
    int 21h

start_name db 9 dup(0)
halt_name  db 9 dup(0)
file_buf label byte

END start
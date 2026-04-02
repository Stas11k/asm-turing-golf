; Minimal byte-level file comparator (COM)
; Usage: cmp file1.ext file2.ext
; Returns: errorlevel 0 = identical, errorlevel 1 = different
.MODEL tiny
.CODE
ORG 100h

start:
    mov si, 81h

    call skip_sp
    mov di, offset fn1
    call copy_name

    call skip_sp
    mov di, offset fn2
    call copy_name

    mov dx, offset fn1
    mov ax, 3D00h
    int 21h
    jc fail
    mov h1, ax

    mov dx, offset fn2
    mov ax, 3D00h
    int 21h
    jc fail
    mov h2, ax

rdloop:
    mov bx, h1
    mov dx, offset b1
    mov cx, 256
    mov ah, 3Fh
    int 21h
    mov s1, ax

    mov bx, h2
    mov dx, offset b2
    mov cx, 256
    mov ah, 3Fh
    int 21h

    cmp ax, s1
    jne fail

    mov cx, ax
    jcxz equal

    mov si, offset b1
    mov di, offset b2
    repe cmpsb
    jne fail

    cmp s1, 256
    je rdloop

equal:
    mov ax, 4C00h
    int 21h

fail:
    mov ax, 4C01h
    int 21h

skip_sp:
    lodsb
    cmp al, ' '
    je skip_sp
    dec si
    ret

copy_name:
    lodsb
    cmp al, ' '
    je cn_end
    cmp al, 0Dh
    je cn_end
    stosb
    jmp copy_name
cn_end:
    mov byte ptr [di], 0
    ret

h1  dw ?
h2  dw ?
s1  dw ?
fn1 db 32 dup(0)
fn2 db 32 dup(0)
b1  db 256 dup(?)
b2  db 256 dup(?)

END start

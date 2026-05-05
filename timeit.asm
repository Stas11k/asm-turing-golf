; TIMEIT.COM — prints current system time as HH:MM:SS.cc\r\n
; Used by TESTALL.BAT for per-test timing
        .model tiny
        .code
        org 100h
start:
        mov ah, 2Ch     ; DOS get system time
        int 21h         ; CH=hrs CL=min DH=sec DL=hundredths
        push dx         ; save sec/hun
        push cx         ; save hrs/min

        mov al, ch
        call print2     ; hours
        mov dl, ':'
        mov ah, 02h
        int 21h

        pop cx
        mov al, cl
        call print2     ; minutes
        mov dl, ':'
        mov ah, 02h
        int 21h

        pop dx
        push dx
        mov al, dh
        call print2     ; seconds
        mov dl, '.'
        mov ah, 02h
        int 21h

        pop dx
        mov al, dl
        call print2     ; hundredths

        mov dl, 0Dh     ; CR
        mov ah, 02h
        int 21h
        mov dl, 0Ah     ; LF
        mov ah, 02h
        int 21h

        mov ah, 4Ch
        int 21h

; Print AL (0-99) as 2 decimal digits
print2:
        aam             ; AH=tens, AL=ones
        push ax
        mov dl, ah
        add dl, '0'
        mov ah, 02h
        int 21h
        pop ax
        mov dl, al
        add dl, '0'
        mov ah, 02h
        int 21h
        ret

        end start
section .text
    global ft_strcmp

ft_strcmp:
.loop:
    mov al, [rdi]        ; carica s1[i]
    mov bl, [rsi]        ; carica s2[i]

    cmp al, bl
    jne .diff            ; se diversi → ritorna differenza

    cmp al, 0
    je .equal            ; se entrambi '\0' → uguali

    inc rdi
    inc rsi
    jmp .loop

.diff:
    movzx eax, al
    movzx ebx, bl
    sub eax, ebx
    ret

.equal:
    xor eax, eax
    ret
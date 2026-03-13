section .text
    global ft_strcpy

ft_strcpy:
    mov rax, rdi

.loop:
    mov dl, [rsi]
    mov [rdi], dl
    cmp dl, 0
    je .done
    inc rsi
    inc rdi
    jmp .loop

.done:
    ret
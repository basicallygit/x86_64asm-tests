section .text
    global _start


_start:
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, buffer
    mov rdx, bufsize
    syscall             ; scanf("%s", buffer);

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, buffer
    mov rdx, bufsize    ; printf("%s", buffer);
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall             ; return 0;
    
    
section .data
    SYS_READ equ 0
    SYS_WRITE equ 1
    STDOUT equ 1
    STDIN equ 0
    bufsize equ 1024

section .bss
	  buffer resb 1024

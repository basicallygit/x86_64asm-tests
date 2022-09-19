section .text
	global _start

_start:
	mov rax, 1         ; sys_write()
	mov rdi, 1
	mov rsi, msg
	mov rdx, len
	syscall

	mov rax, 60        ; sys_exit()
	mov rdi, 0
	syscall
	

	

section .data
	msg db "Hello, World!", 0xA  ; 0xA = newline
	len equ $- msg               ; len = strlen(msg)

section .text
	global _start

_start:
	mov rax, 2         ; sys_open()
	mov rdi, filename
	mov rsi, 0
	mov rdx, 0666      ; O_RDWR
	syscall

	mov rdi, rax       ; place file descriptor in rdi
	mov rax, 0         ; sys_read()
	mov rsi, buf
	mov rdx, bufsize
	syscall

	mov rax, 3         ; sys_close()
	syscall            ; rdi is already the file descriptor


	mov rax, 1         ; sys_write()
	mov rdi, 1
	mov rsi, buf
	mov rdx, bufsize
	syscall

	mov rax, 60        ; sys_exit()
	mov rdi, 0
	syscall
	

	

section .data
	filename db "test.txt"  ; file name
	bufsize dw 4096         ; buffer size to read from file

section .bss
	buf resb 4096           ; allocate space for the buffer

	.intel_syntax noprefix
	.text
factorial:
	push	rbp                         # Пролог функции
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi          # Первый формальный аргумент функции n
	cmp	DWORD PTR -4[rbp], 0            # Сравнение n с нулем
	jne	.L2                             # Переход, если не равно
	mov	eax, 1                          # В eax возвращаемое значение
	jmp	.L3                             # Переход
.L2:
	mov	eax, DWORD PTR -4[rbp]          # В eax лежит n
	sub	eax, 1                          # Уменьшение на 1
	mov	edi, eax                        # В edi первый фактический аргумент функции n
	call	factorial                   # Рекурсивный вызов функции
	imul	eax, DWORD PTR -4[rbp]      # Умножение n, хранящегося в eax
.L3:
	add rsp, 16                         # Эпилог функции
    mov rsp, rbp
    pop rbp
	ret
find_sh:    
	push	rbp                         # Пролог функции
	mov	rbp, rsp
	push	rbx
	sub	rsp, 56
	movsd	QWORD PTR -56[rbp], xmm0    # Первый формальный аргумент функции x
	pxor	xmm0, xmm0
	movsd	QWORD PTR -32[rbp], xmm0    # Вспомогательная переменная next
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0    # Вспомогательная переменная previos
	mov	DWORD PTR -36[rbp], 0           # Счетчик n
.L8:
	mov	eax, DWORD PTR -36[rbp]         # В eax счетчик n
	add	eax, eax                        # Увеличение n
	add	eax, 1
	pxor	xmm0, xmm0                  
	cvtsi2sd	xmm0, eax               # Приведение к типу double
	mov	rax, QWORD PTR -56[rbp]         # В rax лежит формальный аргумент x
	movapd	xmm1, xmm0                  # В xmm1 второй фактический аргумент функции pow 
	movq	xmm0, rax                   # В xmm0 первый фактический аргумент функции pow 
	call	pow@PLT                     # Вызов функции pow
	movq	rbx, xmm0                   # В rbx результат возведения в степень
	mov	eax, DWORD PTR -36[rbp]         # В eax счетчик n
	add	eax, eax                        # Увеличение n
	add	eax, 1                          
	mov	edi, eax                        # В edi первый фактический аргумент функции factorial
	call	factorial                   # Вызов функции factorial
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax               # Приведение к типу double 
	movq	xmm0, rbx                   # В xmm0 делимое из rbx
	divsd	xmm0, xmm1                  # Деление xmm0 на xmm1
	movsd	xmm1, QWORD PTR -32[rbp]    # В xmm1 переменная next
	addsd	xmm0, xmm1                  # Увеличение на next
	movsd	QWORD PTR -32[rbp], xmm0    # Запись результата вычислений в next
	movsd	xmm0, QWORD PTR -32[rbp]    # В xmm0 переменная next
	subsd	xmm0, QWORD PTR -24[rbp]    # Вычитание из next previos
	movq	xmm1, QWORD PTR .LC1[rip]   # В xmm1 вспомогательная переменная для получения модуля
	andpd	xmm1, xmm0                  # В xmm1 модуль разности
	movsd	xmm0, QWORD PTR .LC2[rip]   # В xmm0 множитель 1000
	mulsd	xmm1, xmm0                  # В xmm1 модуль разности next и previous, умноженный на 1000
	movsd	xmm0, QWORD PTR -32[rbp]    # В xmm0 переменная next
	movq	xmm2, QWORD PTR .LC1[rip]   # В xmm2 вспомогательная переменная для получения модуля
	andpd	xmm0, xmm2                  # В xmm0 модуль
	comisd	xmm0, xmm1                  # Сравнение аргументов для определения достижения требуемой приближенности
	jb	.L10                            # Переход, если меньше
	movsd	xmm0, QWORD PTR -32[rbp]    # В xmm0 переменная next
	jmp	.L11                            # Переход
.L10:
	mov	eax, DWORD PTR -36[rbp]         # В eax счетчик n
	add	eax, eax                        # Увеличение n
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax               # Приведение к типу double
	mov	rax, QWORD PTR -56[rbp]         # В rax аргумент x
	movapd	xmm1, xmm0                  # В xmm1 второй фактический аргумент функции pow 
	movq	xmm0, rax                   # В xmm0 первый фактический аргумент функции pow 
	call	pow@PLT                     # Вызов pow
	movq	rbx, xmm0                   # В rbx результат возведения в степень
	mov	eax, DWORD PTR -36[rbp]         # В eax счетчик n
	add	eax, eax                        # Увеличение n
	add	eax, 1
	mov	edi, eax                        # В edi первый фактический аргумент функции factorial
	call	factorial                   # Вызов функции factorial
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax               # Приведение к типу double
	movq	xmm0, rbx                   # В xmm0 делимое из rbx
	divsd	xmm0, xmm1                  # Деление xmm0 на xmm1
	movsd	xmm1, QWORD PTR -24[rbp]    # В xmm1 переменная previous
	addsd	xmm0, xmm1                  # Увеличение на previous
	movsd	QWORD PTR -24[rbp], xmm0    # Запись результата вычислений в previous
	add	DWORD PTR -36[rbp], 1           # Увеличение счетчика на 1
	jmp	.L8                             # Повтор цикла
.L11:
	movq	rax, xmm0                   # В rax next
	movq	xmm0, rax                   # В xmm0 next
	mov	rbx, QWORD PTR -8[rbp]          # Эпилог функции
	add rsp, 56                         
    mov rsp, rbp
    pop rbp
	ret
find_ch:
	push	rbp                         # Пролог функции                 
	mov	rbp, rsp
	push	rbx
	sub	rsp, 56
	movsd	QWORD PTR -56[rbp], xmm0    # Первый формальный аргумент функции x
	pxor	xmm0, xmm0
	movsd	QWORD PTR -32[rbp], xmm0    # Вспомогательная переменная next
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0    # Вспомогательная переменная previous
	mov	DWORD PTR -36[rbp], 0           # Счетчик n
.L16:
	mov	eax, DWORD PTR -36[rbp]         # В eax счетчик n
	add	eax, eax                        # Увеличение n
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax               # Приведение к типу double
	mov	rax, QWORD PTR -56[rbp]         # В rax аргумент x
	movapd	xmm1, xmm0                  # В xmm1 второй фактический аргумент функции pow
	movq	xmm0, rax                   # В xmm0 первый фактический аргумент функции pow
	call	pow@PLT                     # Вызов функции pow
	movq	rbx, xmm0                   # В rbx результат возведения в степень
	mov	eax, DWORD PTR -36[rbp]         # В eax счетчик
	add	eax, eax                        # Увеличение n
	mov	edi, eax                        # В edi первый фактический аргумент функции factorial
	call	factorial                   # Вызов функции factorial
	pxor	xmm1, xmm1                  
	cvtsi2sd	xmm1, eax               # Приведение к типу double
	movq	xmm0, rbx                   # В xmm0 делимое из rbx
	divsd	xmm0, xmm1                  # Деление xmm0 на xmm1
	movsd	xmm1, QWORD PTR -32[rbp]    # В xmm1 переменная next
	addsd	xmm0, xmm1                  # Увеличение на next
	movsd	QWORD PTR -32[rbp], xmm0    # Запись результата в next
	movsd	xmm0, QWORD PTR -32[rbp]    # В xmm0 переменная next
	subsd	xmm0, QWORD PTR -24[rbp]    # Вычитание из next previous
	movq	xmm1, QWORD PTR .LC1[rip]   # В xmm1 вспомогательная переменная для получения модуля
	andpd	xmm1, xmm0                  # В xmm1 модуль разности
	movsd	xmm0, QWORD PTR .LC2[rip]   # В xmm0 множитель 1000
	mulsd	xmm1, xmm0                  # В xmm1 модуль разности next и previous, умноженный на 1000
	movsd	xmm0, QWORD PTR -32[rbp]    # В xmm0 переменная next
	movq	xmm2, QWORD PTR .LC1[rip]   # В xmm2 вспомогательная переменная для получения модуля
	andpd	xmm0, xmm2                  # В xmm0 модуль
	comisd	xmm0, xmm1                  # Сравнение аргументов для определения достижения требуемой приближенности
	jb	.L18                            # Переход, если меньше
	movsd	xmm0, QWORD PTR -32[rbp]    # В xmm0 переменная next
	jmp	.L19                            # Переход
.L18:
	mov	eax, DWORD PTR -36[rbp]         # В eax счетчик n
	add	eax, eax                        # Увеличение n
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax               # Приведение к типу double
	mov	rax, QWORD PTR -56[rbp]         # В rax аргумент x
	movapd	xmm1, xmm0                  # В xmm1 второй фактический аргумент функции pow
	movq	xmm0, rax                   # В xmm0 первый фактический аргумент функции pow
	call	pow@PLT                     # Вызов функции pow
	movq	rbx, xmm0                   # В rbx результат возведения в степень
	mov	eax, DWORD PTR -36[rbp]         # В eax счетчик n
	add	eax, eax                        # Увеличение n
	mov	edi, eax                        # В edi первый фактический аргумент функции factorial
	call	factorial                   # Вызов функции factorial
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax               # Приведение к типу double
	movq	xmm0, rbx                   # В xmm0 делимое из rbx
	divsd	xmm0, xmm1                  # Деление xmm0 на xmm1
	movsd	xmm1, QWORD PTR -24[rbp]    # В xmm1 переменная previous
	addsd	xmm0, xmm1                  # Увеличение на previous
	movsd	QWORD PTR -24[rbp], xmm0    # Запись результата вычислений в previous
	add	DWORD PTR -36[rbp], 1           # Увеличение счетчика
	jmp	.L16                            # Повтор цикла
.L19:
	movq	rax, xmm0                   # В rax next
	movq	xmm0, rax                   # В xmm0 next
	mov	rbx, QWORD PTR -8[rbp]          # Эпилог функции
	add rsp, 56
    mov rsp, rbp
    pop rbp
	ret
	.section	.rodata
	.align 8
.LC3:
	.string	"Enter a number 'x' satisfying the inequality: 0 < |x| < Pi: "
.LC4:
	.string	"%lf"
.LC6:
	.string	"Incorrect data"
.LC7:
	.string	"cth(x) = %lf\n"
	.text
	.globl	main
main:
	push	rbp                         # Пролог функции
	mov	rbp, rsp
	push	rbx
	sub	rsp, 24
	mov	rax, QWORD PTR fs:40            # В rax вспомогательная информаций
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax                        # В rdi первый фактический аргумент функции printf
	mov	eax, 0
	call	printf@PLT
	lea	rax, -32[rbp]                   # В rax лежит x 
	mov	rsi, rax                        # В rsi x
	lea	rax, .LC4[rip]                  # В rax формат
	mov	rdi, rax                        # В rdi формат для ввода данных, первый фактический аргумент функции
	mov	eax, 0
	call	__isoc99_scanf@PLT          # Вызов функции scanf
	movsd	xmm0, QWORD PTR -32[rbp]    # В xmm0 лежит x
	pxor	xmm1, xmm1
	ucomisd	xmm0, xmm1                  # Сравнение x c 0
	jp	.L28                            # Переход, если не равно
	pxor	xmm1, xmm1                  
	ucomisd	xmm0, xmm1                  
	je	.L21                            # Переход, если равно
.L28:
	movsd	xmm0, QWORD PTR -32[rbp]    # В xmm0 лежит x
	movq	xmm1, QWORD PTR .LC1[rip]   # В xmm1 вспомогательная переменная для получения модуля
	andpd	xmm0, xmm1                  # Получение модуля
	comisd	xmm0, QWORD PTR .LC5[rip]   # Сравнение модуля x с числом pi
	jb	.L29                            # Переход, если меньше
.L21:
	lea	rax, .LC6[rip]                  # В rax вспомогательная информация
	mov	rdi, rax                        # В rdi первый фактический аргумент функции printf 
	mov	eax, 0
	call	printf@PLT
	jmp	.L25                            # Переход
.L29:
	mov	rax, QWORD PTR -32[rbp]         # В rax лежит x
	movq	xmm0, rax                   # В xmm0 первый фактический аргумент функции find_ch
	call	find_ch                     # Вызов find_ch
	movq	rbx, xmm0                   # В rbx результат выполнения функции
	mov	rax, QWORD PTR -32[rbp]         # В rax лежит x
	movq	xmm0, rax                   # В xmm0 первый фактический аргумент функции find_sh
	call	find_sh                     # Вызов find_sh
	movq	xmm2, rbx                   # В xmm2 гиперболический косинус x
	divsd	xmm2, xmm0                  # Деление гиперболического косинуса на гиперболический синус
	movq	rax, xmm2                   # В rax результат деления
	movq	xmm0, rax                   # В xmm0 результат деления
	lea	rax, .LC7[rip]                  # В rax вспомогательная информация
	mov	rdi, rax                        # В rdi первый фактический аргумент функции printf
	mov	eax, 1
	call	printf@PLT            
.L25:
	mov	eax, 0                          # Очистка
	mov	rdx, QWORD PTR -24[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	mov	rbx, QWORD PTR -8[rbp]          # Эпилог функции
	add rsp, 24
    mov rsp, rbp
    pop rbp
	ret
	.section	.rodata
	.align 16
.LC1:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.align 8
.LC5:
	.long	1413754136
	.long	1074340347
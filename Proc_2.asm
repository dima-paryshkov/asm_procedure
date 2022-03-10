.386
.MODEL FLAT
.CODE
	_FUNCSTR@20 PROC
	PUSH EBP
	MOV EBP, ESP

	; Длина строки-источника должна быть больше нуля.
	MOV EDX, [EBP+12]
	CMP EDX, 0
	JBE ERROR

	MOV ESI, [EBP+8] ; исходная строка
	XOR EDX, EDX ; индекс обрабатываемого элемента
	XOR EBX, EBX
	MOV EAX, [EBP+12] ; количество символов с исходной строке
	MOV BH, [EBP+24] 
	MOV ECX, [EBP+16]
	MOV EDI, [EBP+24] 
	FUNC:
		MOV BL, [ESI] ;очередной элемент
		CMP BL, '0' ; если меньше символа нуля и больше символа 9 то записать исходный символ в строку, иначе заменить на нужный символ
		JB FINCT
		CMP BL, '9'
		JA FINCT
		MOV [ECX + EDX], EDI
		JBE FINC3
		FINCT:
			MOV [ECX + EDX], BL
		FINC3:
		INC ESI		; берём следующий символ
		ADD EDX, 1
		DEC EAX		; уменьшение на 1 
		CMP EAX, 0	   ; если все сисволы обработаны выйти из цикла, иначе продолжить
		JA FUNC

	POP EBP
	MOV EAX, 1
	RET	20   ; В стеке остаётся 5 аргументов по 4 байта.

ERROR:
	POP EBP
	MOV EAX, 0
	RET 20

	_FUNCSTR@20 ENDP
END

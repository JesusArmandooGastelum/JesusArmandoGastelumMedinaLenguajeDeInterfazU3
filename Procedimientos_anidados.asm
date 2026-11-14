; Lenguajes de Interfaz - Jesús Armando Gastelum Medina - Grupo 9-10 - Prof. Jose Luis Medina Jimenez
; Práctica: Procedimientos anidados
; Descripción: main llama a procUno y procUno llama a procDos. En cada nivel se
; imprime en hexadecimal el valor en el tope de la pila ([esp]), que es la
; dirección de retorno de ese procedimiento.
INCLUDE Irvine32.inc

.data
.code
main PROC
    mov eax, [esp]          ; en main, [esp] contiene la dirección de retorno al sistema
    call WriteHex           ; imprime el valor en hexadecimal
    call Crlf
    call procUno            ; llamada al primer procedimiento (anida a procDos)
    exit
main ENDP

procUno PROC
    mov eax, [esp]          ; [esp] = dirección de retorno hacia main
    call WriteHex
    call Crlf
    call procDos            ; llamada anidada: procDos se ejecuta dentro de procUno
    ret                     ; regresa a main
procUno ENDP

procDos PROC
    mov eax, [esp]          ; [esp] = dirección de retorno hacia procUno
    call WriteHex
    call Crlf
    ret                     ; regresa a procUno
procDos ENDP
END main

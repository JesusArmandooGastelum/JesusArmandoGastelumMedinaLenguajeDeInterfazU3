; Lenguajes de Interfaz - Jesús Armando Gastelum Medina - Grupo 9-10 - Prof. Jose Luis Medina Jimenez
; Práctica: Macros
; Descripción: define dos macros (MostrarMensaje y Multi) y las usa en main.
INCLUDE Irvine32.inc

; Macro que imprime una cadena seguida de un salto de línea
MostrarMensaje MACRO texto
    mov edx, OFFSET texto
    call WriteString
    call Crlf
ENDM

; Macro que multiplica dos números e imprime el resultado con signo
Multi MACRO num1, num2
    mov eax, num1
    imul eax, num2          ; EAX = num1 * num2
    call WriteInt
    call Crlf
ENDM

.data
mensajeBienvenida BYTE "BIENVENIDO AL SISTEMA DE GLOWUP MAKEUP SINALOA", 0
mensajeFin        BYTE "ADIOS", 0

.code
main PROC
    MostrarMensaje mensajeBienvenida    ; imprime la bienvenida
    MostrarMensaje mensajeFin           ; imprime la despedida
    Multi 4, 5                          ; imprime +20
    exit                                ; termina el programa
main ENDP
END main

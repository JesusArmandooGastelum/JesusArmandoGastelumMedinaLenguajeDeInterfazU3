; Lenguajes de Interfaz - Jesús Armando Gastelum Medina - Grupo 9-10 - Prof. Jose Luis Medina Jimenez
; Práctica: Procedimiento (modularizar)
; Descripción: un mismo procedimiento (mensajeAviso) se llama dos veces para
; reutilizar el código en lugar de repetirlo.
INCLUDE Irvine32.inc

.data
mensajeInicio        BYTE "inicio de programa", 0
mensajeProcedimiento BYTE "Estoy dentro del procedimiento", 0
mensajeFin           BYTE "Fin del programa", 0

.code
main PROC
    mov edx, OFFSET mensajeInicio
    call WriteString
    call Crlf

    ; Primera llamada
    call mensajeAviso
    mov eax, 10

    ; Segunda llamada
    call mensajeAviso       ; EIP salta a las instrucciones dentro del procedimiento
    mov eax, 20

    mov edx, OFFSET mensajeFin
    call WriteString
    call Crlf
    exit
main ENDP

mensajeAviso PROC
    mov edx, OFFSET mensajeProcedimiento
    call WriteString
    call Crlf
    ret                     ; recupera de la pila la dirección de la instrucción siguiente al CALL
mensajeAviso ENDP
END main

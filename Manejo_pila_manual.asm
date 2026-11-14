; Lenguajes de Interfaz - Jesús Armando Gastelum Medina - Grupo 9-10 - Prof. Jose Luis Medina Jimenez
; Práctica: Manejo de pila manual
; Descripción: se pasan dos parámetros por la pila (1 y 2) y el procedimiento
; sumarPila los lee usando EBP como punto de referencia y deja el producto en EAX.
INCLUDE Irvine32.inc

.data
.code
main PROC
    mov ebx, 10             ; EBX con un valor que el procedimiento debe preservar
    push 1                  ; segundo parámetro
    push 2                  ; primer parámetro
    call sumarPila          ; el procedimiento limpia la pila con ret 8
    nop                     ; punto para inspeccionar EAX (resultado) en el depurador
    exit
main ENDP

sumarPila PROC
    push ebp                ; guarda EBP anterior en la pila
    mov ebp, esp            ; EBP pasa a ser la referencia para moverse en la pila
    push ebx                ; preserva EBX
    mov eax, [ebp+8]        ; accede al valor 2
    mov ebx, [ebp+12]       ; accede al valor 1
    imul eax, ebx           ; imul permite especificar 2 registros (mul siempre multiplica EAX)
    pop ebx                 ; restaura EBX
    pop ebp                 ; restaura EBP
    ret 8                   ; regresa y limpia los 2 parámetros (8 bytes) que se pusieron antes del call
sumarPila ENDP
END main

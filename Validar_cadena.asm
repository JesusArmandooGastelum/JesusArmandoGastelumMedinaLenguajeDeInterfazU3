; Lenguajes de Interfaz - Jesús Armando Gastelum Medina - Grupo 9-10 - Prof. Jose Luis Medina Jimenez
; Práctica: Validar cadena
; Descripción: pide una cadena al usuario e indica si está vacía o no.
INCLUDE Irvine32.inc

.data
cadena      BYTE 50 DUP(0)                                                  ; buffer donde se guarda lo que escribe el usuario
msgPedir    BYTE "Ingresa una cadena (o presiona Enter para dejarla vacia): ", 0
msgVacia    BYTE "La cadena ESTA vacia.", 0
msgNoVacia  BYTE "La cadena NO esta vacia.", 0

.code
main PROC
    ; 1. Pedir y leer la cadena
    mov edx, OFFSET msgPedir
    call WriteString                ; muestra el mensaje de petición
    mov edx, OFFSET cadena          ; EDX = dirección del buffer
    mov ecx, SIZEOF cadena - 1      ; ECX = máximo de caracteres (deja 1 byte para el terminador nulo)
    call ReadString                 ; lee la entrada del usuario (guarda la longitud en EAX)

    ; 2. Validar si está vacía comprobando el primer byte
    cmp BYTE PTR [cadena], 0        ; ¿el primer carácter es el terminador nulo (0)?
    je EsVacia                      ; si es igual a 0, está vacía

NoEsVacia:
    mov edx, OFFSET msgNoVacia
    call WriteString                ; muestra "La cadena NO esta vacia."
    call Crlf
    jmp Fin                         ; salta para no ejecutar la rama EsVacia

EsVacia:
    mov edx, OFFSET msgVacia
    call WriteString                ; muestra "La cadena ESTA vacia."
    call Crlf

Fin:
    exit                            ; termina el programa
main ENDP
END main

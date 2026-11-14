# Unidad 3 – Prácticas de Lenguaje Ensamblador

**Materia:** Lenguajes de Interfaz
**Alumno:** Jesús Armando Gastelum Medina
**Grupo:** 9-10
**Profesor:** Jose Luis Medina Jimenez

Cinco programas en ensamblador x86 (MASM) que usan la biblioteca `Irvine32`.

## Programas

### 1. `Validar_cadena.asm`
Pide al usuario una cadena con `ReadString` y revisa el primer byte del buffer: si es `0` la cadena está vacía.
**Qué se comprobó:** al presionar solo Enter muestra *"La cadena ESTA vacia."*; al escribir cualquier texto muestra *"La cadena NO esta vacia."*.

### 2. `Procedimientos_anidados.asm`
`main` llama a `procUno`, y este a su vez llama a `procDos`. En cada nivel se imprime en hexadecimal `[esp]`, que es la dirección de retorno.
**Qué se comprobó:** se imprimen tres valores hexadecimales; los de `procUno` y `procDos` son direcciones dentro de `main` y de `procUno` respectivamente, y cada `ret` regresa al lugar correcto.

### 3. `Procedimiento_modularizar.asm`
Un solo procedimiento (`mensajeAviso`) se llama dos veces para reutilizar código.
**Qué se comprobó:** se imprime *"inicio de programa"*, dos veces *"Estoy dentro del procedimiento"* y por último *"Fin del programa"*; después de cada `call` el flujo continúa en la instrucción siguiente.

### 4. `Macros.asm`
Define las macros `MostrarMensaje` (imprime una cadena con salto de línea) y `Multi` (multiplica dos números e imprime el resultado).
**Qué se comprobó:** se muestran los mensajes de bienvenida y despedida, y la multiplicación `4 * 5` imprime `+20`.

### 5. `Manejo_pila_manual.asm`
Se meten dos parámetros con `push`, y `sumarPila` los lee con `EBP` (`[ebp+8]` y `[ebp+12]`), los multiplica con `imul`, restaura `EBX` y `EBP` y regresa con `ret 8` para limpiar la pila.
**Qué se comprobó:** en el depurador, `EAX` contiene el producto (`2`), `EBX` conserva el valor `10` y `ESP` queda igual que antes de meter los parámetros.

## Cómo ejecutarlos
Se ensamblan y ejecutan con Visual Studio y la configuración de Irvine32 (o el entorno equivalente usado en clase).

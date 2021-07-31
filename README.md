<h2>Shell scripts</h2>

<h3>Ejercicios de scripts del módulo de Implementación de sistemas operativos</h3>

1. Fecha, usuarios conectados, arquitectura, tiempo de actividad.

2. Directorio de trabajo.

3. Script con parámetros.

4. Comprueba los parámetros que se le pasan al script.

5. Crear archivo con la extensión que le pasamos.

6. Comprueba si existe y si es un directorio.

7. Ejemplo for.

8. Recorre los ficheros de un directorio y les asigna permisos de 777.

9. Comprueba si un número es par o impar.

10. Pide la edad como parámetro y comprueba si es mayor de edad.

11. Pide un código postal y a que comunidad autónoma pertenece

12. Busca un fichero he índica si existe y si es posible leerlo.

13. Cuenta los caracteres de una cadena.

14. Lee un archivo de ventas, a su vez crea dos ficheros en los que organiza las ventas según el precio

15. Ping a un rango de direcciones, devuelve las IPs de los equipos conectados.

16. Menú con diferentes opciones para facilitar la gestión de apuntes.
OPCIONES EN DETALLE:
0) Salir. Termina el script devolviendo valor 1.
1) Introducir apuntes. Se pedirá para cada apunte los datos de concepto e importe. Estos valores se agregarán al archivo de apuntes del día llamado YYMMDD (YY = año, MM = mes, DD = día) grabando primero concepto y luego importe separado por “,” (carácter coma). Se termina cuando el importe introducido es 0.
2) Ordenar apuntes. Se ordenará el archivo de apuntes del día sobre otro con el mismo nombre pero añadiendo “.ord” por el campo concepto ascendentemente.
3) Visualizar apuntes. Se mostrará el contenido del archivo ordenado de apuntes del día (si no existe se avisará) de forma que se pueda avanzar o retroceder. 
4) Imprimir apuntes. Se mandará a la cola de impresión por defecto el archivo de apuntes ordenado. Si le pones cabecera y rótulos a los campos, pues mejor. 
5) Calcular total importes. Es lo más difícil. Leer los apuntes del archivo del día acumulando los importes sobre una variable total. Al finalizar la lectura se muestra el valor total.
6) Subshell. Se ejecuta una shell para que el usuario pueda ejecutar comandos.


17. En un desastre informático se ha perdido la estructura de carpetas original. Andan repartidos por el todo disco una serie de archivos de texto plano ASCII 
con extensión ".NOTAS" El contenido de cada unos de esos posibles archivos es: ALUMNO:MODULO:NOTA
Se pide:
1) Recomponer TODOS los archivos ".NOTAS" que encontremos, en UNO sólo llamado 
"rescatedenotas".
2) Mostrar al usuario, ordenado de menor a mayor por el nombre del alumno el contenido del archivo resultante.


18. Crea un script llamado menú de forma que reciba como parámetro el nombre de un usuario.
Debe decirme:
1)	Si ese usuario existe en el sistema
2)	Si está conectado en este momento me pregunte si quiero echarlo del sistema. En caso positivo le echo.
3)	Si no está conectado le mando un correo. El texto del mensaje se introduce en ese mismo instante.


19. Lee un fichero del que calcula el total, la comisión y a cobrar.
Publica en el servidor web (copia un archivo a su ruta servida) el archivo codigoemp.ventas.html que contiene el informe de un empleado con sus ventas 
y su comisión. Habrá tantos archivos  codigoemp.ventas.html como empleados dentro del archivo empleados.


20. Lee de un archivo y organiza los alumnos según el módulo y año que se le pasa al script.
Recibiendo el primer parámetro que será el año y el segundo el código del módulo, crearemos un fichero cuyo nombre será el conjunto de año+modulo, que contendrá los alumnos de ese módulo y en ese año ordenado por apellidos ascendentemente.
Si no hay alumnos de ese año, o en ese año no se fue profesor de la asignatura, el fichero año+modulo tendrá uno de estos dos posibles textos:
NO FUE PROFESOR EN EL AÑO 9999. FIN DE PROCESO.
o
NO IMPARTIO EL MODULO AAAA. FIN DE PROCESO.


21. Da de alta a usuarios de sistema (alumnos) y les asigna un directorio (grupo).
Partimos de un archivo de texto llamado alumnos.txt, cuyos campos están separados por el carácter ; (punto y coma) que tiene la siguiente estructura:
nombre;apellido1;apellido2;ciclo
Se pide:
Desarrollar un script en Linux que partiendo de los datos del archivo, de alta a un nuevo usuario en el sistema, comprobando en los posible los errores que podamos detectar, bajo las siguientes especificaciones:
1)	Los datos de los alumnos creados con éxito se almacenarán en un archivo nuevo creados+fecha [aammdd]
2)	Los que no se hayan podido crear, en el archivo errores+fecha [aammdd], informando del motivo que impidió su creación.
3)	El nombre del usuario será la primera letra del nombre+apellido1+apellido2
4)	Pertenecerá al grupo ciclo. Suponemos que estos datos vienen depurados, es decir, será uno de los siguientes: DAW, ASIR, PCPI, GAD, AFI, AVI,PAS, COC
5)	El directorio personal (home del usuario) se creará dentro de una carpeta con el mismo nombre del ciclo.
6)	Dentro de su carpeta personal, se creará el punto de montaje comun y en el inicio de sesión del usuario se procederá a realizar automáticamente el montaje de la ruta SMB


22. Busca todos los archivos con la extensión que le pasamos y almacena la ruta de cada uno.
En un desastre informático se ha perdido la estructura de carpetas original. Andan repartidos por el todo disco una serie de archivos de tipo texto con extensión ".apu"
El contenido de cada unos de esos posibles archivos es:
	importe:concepto:fecha
Se pide:
1) Recomponer TODOS los archivos ".apu" que encontremos, en UNO sólo llamado 
"rescate.apu".
2) Mostrar al usuario, ordenado de mayor a menor por importe el contenido del archivo, más una línea que nos dé el acumulado de los importes.


23. Lee un fichero y genera un informe de cada vendedor el cual será mandado por correo.
El archivo ventas.log contiene la ventas del mes. codigoemp:concepto:importe
Donde:
	codigoemp	-> 	nombre del usuario en el sistema
	concepto 	-> 	razón de la venta
	importe 	-> 	valor en euros (entero)
Manda por correo a cada empleado un informe con sus ventas y su comisión. Siendo la comisión el 5% del total de sus ventas. 


24. El sistema registra en el archivo "actividad.log" cada vez que un usuario accede a un archivo.
usuario:nombrearchivo:operacion:bytes
Donde: 
usuario: 		será el nombre del usuario que accede al archivo
nombrearchivo:	será el nombre del archivo accedido
operacion:		r (lectura) o r (escritura)
bytes:			número de bytes utilizados en operación


25. En un desastre informático se ha perdido la estructura de carpetas original. Andan repartidos por el todo disco una serie de archivos de texto plano ASCII 
con extensión ".NOTAS" El contenido de cada unos de esos posibles archivos es: ALUMNO:MODULO:NOTA
Se pide:
1) Recomponer TODOS los archivos ".NOTAS" que encontremos, en UNO sólo llamado 
"rescatedenotas".
2) Mostrar al usuario, ordenado de menor a mayor por el nombre del alumno el contenido del archivo resultante.
3)  Calcular las medias de los módulos FOL y SIS (suponemos que siempre existirá al menos un alumno)


26. Recompila cada x tiempo las condiciones climatologicas (temperatura, humedad) 

27. Lee un archivo con los votos totales de una provincia y los ordena por partido politico y cantidad de votos.

28. Organiza los archivos según su extensión.


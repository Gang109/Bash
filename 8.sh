#!/bin/bash

for i in $(ls -l)
do
	echo "El valor es $i"
done


Ejercicio 7c For ls + chmod
#!/bin/bash

for i in $(ls -l)
do
	chmod 777 ${i}
done
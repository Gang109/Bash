  
#!/bin/bash

#tiempo=10
#codigopostal=28001
#ip=172.16.101.44
#usuario=jose
#password=123456

IFS=":"
read ip usuario password codigopostal tiempo < meteosat.conf

while true
do
	temp=`shuf -i 0-100 -n 1`
	let temp=$temp-50
	humedad=`shuf -i 0-100 -n 1`
	presion=`shuf -i 0-1013 -n 1`
	viento=`shuf -i 0-200 -n 1`
	direccion=`shuf -i 0-360 -n 1`
	nombrearchivo=`date +%y%m%d.%H%M%S.`$codigopostal

	echo $temp":"$humedad":"$presion":"$viento":"$direccion>$nombrearchivo

	echo "open $ip > seqftp
	echo "user $usuario $password" >> seqftp
	echo "put "nombrearchivo" >> seqftp

	ftp -n < seqftp

	rm $nombrearchivo
	echo $temp":"$humedad":"$presion":"$viento":"$direccion>$codigopostal


	sleep $timepo
done
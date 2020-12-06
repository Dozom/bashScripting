#!/bin/bash

cadena_hexadecimal=""
echo "Introduce la cadena a convertir a ascii:"
	read cadena

cadena=`echo $cadena | tr -d " "`

if [ $(( ${#cadena} % 2 ))  == 0 ];then
	for byte in $(seq 0 2 $(( ${#cadena} -1 )) );do
		cadena_hexadecimal+="\x${cadena:byte:2}"
	done;
fi

echo -e $cadena_hexadecimal

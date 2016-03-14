#!/bin/bash

function download {

	echo 'Cuantas paginas contiene el comic? : '
	read num
	echo "Ahora ingrese el codigo del URL : "
	read code
	i=1
	while [ $i -le $num ]; do
		c="http://image.issuu.com/${code}/jpg/page_${i}.jpg"
		wget $c
		let i=i+1
	done
}

function move {

	echo "Moviendo archivos...por favor espere"
	sleep 1
	mkdir $1
	mv *.jpg $1
	echo "Archivos movidos exitosamente"
}

echo "Ingrese el nombre del comic: "
read name
download
move $name

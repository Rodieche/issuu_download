#!/bin/bash

function download {

	echo 'Cuantas paginas contiene el comic? : '
	read num
	echo "Ahora ingrese el codigo del URL : "
	read code
	i=1
	while [ $i -le $num ]; do
		if [ $i -lt 10 ]; then
			c="http://image.issuu.com/${code}/jpg/page_${i}.jpg"
			wget $c
			mv "page_${i}.jpg" "page_0${i}.jpg"
		else
			c="http://image.issuu.com/${code}/jpg/page_${i}.jpg"
			wget $c
		fi
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

function make_cbz {

	zip "${1}.cbz" *.jpg
	rm *.jpg
}

echo "Ingrese el nombre del comic (sin espacios, use guiones bajos en todo caso): "
read name
download
move $name
cd $name
make_cbz $name
cd ..


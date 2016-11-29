#!/bin/bash

function get_data {							# OBTENGO LOS DATOS DEL ARCHIVO A DESCARGAR
	echo "Ingrese el nombre del comic (sin espacios, use guiones bajos en todo caso): "
	read name
	echo 'Cuantas paginas contiene el comic? : '
	read num
	echo "Ahora ingrese la URL del comic : "
	read code
}

function get_source_code {						# GET THE SOURCE CODE FROM THE WEB SITE
	
	curl -# $code >> page_tmp.rge
}

function get_images {							# DOWNLOAD DE IMAGES FROM THE WEB PAGE

	local i=1
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

function move_images {								# MOVE THE IMAGES TO CREATE THE CBZ FILE

	echo "Moviendo archivos...por favor espere"
	sleep 1
	mkdir $name
	mv *.jpg $name
	echo "Archivos movidos exitosamente"
}

function make_cbz {								 # MAKE THE CBZ FILE

	zip "${name}.cbz" *.jpg
	rm *.jpg
}

function delete_page {								# DELETE THE TMP FILE THAT HAVE THE SOURCE CODE

	rm page_tmp.rge

}

function find_in_source_code {							# PERMIT TO FIND THE LINK WHERE ARE THE PAGES

	local i=0
	grep -r "https://image.issuu.com" page_tmp.rge >> link.rge
	frase=($(sed -n '1p' link.txt))					#obtengo la primera linea que es con
									#la que voy a trabajar para poder descargar


}

get_data
#get_source_code
#find_in_source_code
get_images
move_images
make_cbz
#delete_page



#download
#move $name
#cd $name
#make_cbz $name
#cd ..


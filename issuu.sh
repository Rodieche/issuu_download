#!/bin/bash
echo "Cuantas paginas contiene el comic? : "
read num
echo "Ahora ingrese el codigo del URL : "
read code

#160309141815-9126d0ee4936850f0f70c6535ce4b705

i=1
while [ $i -lt $num ]; do
	c="https://image.issuu.com/${code}/jpg/page_${i}.jpg"
	wget $c
	let i=i+1
done

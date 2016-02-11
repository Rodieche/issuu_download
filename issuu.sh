#!/bin/bash
echo "Cuantas paginas contiene el comic? : "
read num
i=1
while [ $i -lt $num ]; do
	c="http://image.issuu.com/150506211233-c003f4cb0e726263c7d6363460158bf6/jpg/page_${i}.jpg"
	wget $c
	let i=i+1
done

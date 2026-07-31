#!/bin/bash

for i in *scad; do  echo $i; ./scadtopng.sh $i; done
for i in *.png; do convert -trim $i "$i.trim.png"; done
mv *trim* ../img


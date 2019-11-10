#!/bin/bash

./wham-2d Px=0 5.0 13.0 500  Py=0 -1.117010 1.151917 500 1e-12 300 0 metadatafile freefile 0

grep -v 'inf' freefile > free_energy
sed -i '1d' free_energy
sed -i '/^$/d' free_energy 
sed -i -e 's/\t/ /g' free_energy

#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/laia/ILS/vmd:/usr/lib64/:/home/laia/ILS/lib/tcl8.5.7

date > duracion
/home/laia/ILS/vmd/vmd_LINUXAMD64 -dispdev text -e ils.vmd >& ils.log
date >> duracion


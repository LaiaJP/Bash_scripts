#!/bin/bash

rm *.xy histograms/*

./umbrella_integration.x -d ../umb -T 300 -min 5.3 -max 13.3 -daidxi -n 1000 -u kcal -r -1 -v 2 -ss 500000


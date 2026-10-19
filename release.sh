#!/bin/sh
set -e
#This script releases refenums.sty in the format required by CTAN

#First create ZIP file containing versioned files only
git archive -o refenums.zip --prefix=refenums/ HEAD

#Delete ".gitignore" and "release.sh". These files is not wanted by CTAN
#In the future, other files starting with "." might be added, therefore we delete all files starting with "."
zip refenums.zip -d /refenums/\.*
zip refenums.zip -d ./refenums/release.sh

#Generate refenums-demo.pdf
lualatex refenums-demo
lualatex refenums-demo
lualatex refenums-demo

#Add refenums-demo.pdf to the archive; CTAN renders README.md itself
mkdir refenums
cp refenums-demo.pdf refenums
zip -g refenums.zip refenums/refenums-demo.pdf

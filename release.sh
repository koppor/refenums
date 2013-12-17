#!/bin/sh
#This script releases refenums.sty in the format required by CTAN

#First create ZIP file containing versioned files only
git archive -o refenums.zip --prefix=refenums/ HEAD

#Delete ".gitignore". This files is not wanted by CTAN
#In the future, other files starting with "." might be added, therefore we delete all files starting with "."
zip -d refenums.zip /refenums/\.*
zip -d refenums.zip /refenums/release.sh

#Generate demo.pdf
pdflatex demo
pdflatex demo
pdflatex demo

#Add demo.pdf to the archive
mkdir refenums
cp demo.pdf refenums
zip -g refenums.zip refenums/demo.pdf
rm refenums/demo.pdf

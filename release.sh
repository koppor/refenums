#!/bin/sh
#This script releases refenums.sty in the format required by CTAN

#First create ZIP file containing versioned files only
git archive -o refenums.zip --prefix=refenums/ HEAD

#Delete ".gitignore" and "release.sh". These files is not wanted by CTAN
#In the future, other files starting with "." might be added, therefore we delete all files starting with "."
zip refenums.zip -d /refenums/\.*
zip refenums.zip -d ./refenums/release.sh

#Generate demo.pdf
pdflatex demo
pdflatex demo
pdflatex demo

#Generate README.pdf
pandoc -f markdown_github-hard_line_breaks -t latex README.md -o README.pdf

#Add demo.pdf and README.pdf to the archive
mkdir refenums
cp demo.pdf README.pdf refenums
zip -g refenums.zip refenums/demo.pdf refenums/README.pdf

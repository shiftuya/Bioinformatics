#!/bin/bash

fastqc $1.fastq.gz
mv $1_fastqc.html $1.html
rm $1_fastqc.zip
bwa index reference.fna
bwa mem reference.fna $1.fastq.gz > $1.sam
if (( $(echo  $(samtools flagstat $1.sam | grep -o -P '[0-9]*(\.[0-9]*)?(?=%)')">90" | bc -l) )); then
  echo "OK"
else
  echo "Not OK"
fi

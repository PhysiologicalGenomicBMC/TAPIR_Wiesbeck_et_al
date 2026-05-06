#!/bin/bash 


for i in 1 2 4
do
fastqc --outdir fastqc B73_${i}_EKDL2500348*-1A_235NFMLT4_L8_1.fq.gz
fastqc --outdir fastqc B73_${i}_EKDL2500348*-1A_235NFMLT4_L8_2.fq.gz
done


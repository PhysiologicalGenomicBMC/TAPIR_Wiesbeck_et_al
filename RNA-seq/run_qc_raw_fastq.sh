#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --mem-per-cpu=32G
#SBATCH --output=/work/project/ladcol_002/Maxi_new_data/QC/fastqc%j.out
#SBATCH --output=/work/project/ladcol_002/Maxi_new_data/QC/fastqc%j.err
#SBATCH --nodes=1
#SBATCH --time=00:00:00

#!/bin/bash -l
#SBATCH -p compute                 	#specify partition
#SBATCH -N 1                        #specify number of nodes
#SBATCH --cpus-per-task=24   	    #specify number of cpus
#SBATCH -t 5-00:00:00                  #job time limit <hr:min:sec>
#SBATCH -J  gaussian           	    #job name
#SBATCH -A  pv911003               #project account
#SBATCH --mem-per-cpu=1900
#SBATCH --ntasks=1

#module purge                            #purge all module
#conda activate base
#echo "USER=$USER"
#id
#group
module load Gaussian/16.C.02-AVX2      	#load gaussian version16
which g16
inp=$1
basename="{inp%.*}"
logname="{$basename}.log"

FILENAME=$inp      # please change the FILENAME

WORKDIR=$SLURM_SUBMIT_DIR
#################################
#create temporary scratch directory
mkdir -p /scratch/lt200439-sensor/$USER/$SLURM_JOB_ID
#export gaussain scratch directory to this one
export GAUSS_SCRDIR=/scratch/lt200439-sensor/$USER/$SLURM_JOB_ID
g16 < $WORKDIR/"$inp" > $WORKDIR/"$logname"
#!/bin/bash -l
#SBATCH -p compute                      #specify partition
#SBATCH -N 1                        #specify number of nodes
#SBATCH --cpus-per-task=16          #specify number of cpus
#SBATCH -t 02:00:00                  #job time limit <hr:min:sec>
#SBATCH -J  testing                 #job name
#SBATCH -A  lt200439               #project account
#SBATCH --mem=70G
#SBATCH --ntasks=1

#module purge                            #purge all module
#conda activate base
#echo "USER=$USER"
#id
#group
module load Gaussian/16.C.02-AVX2       #load gaussian version16
which g16
FILENAME=CH2O-Neu-td-opt      # please change the FILENAME

WORKDIR=$SLURM_SUBMIT_DIR
#################################
#create temporary scratch directory
mkdir -p /scratch/lt200439-sensor/$USER/$SLURM_JOB_ID
#export gaussain scratch directory to this one
export GAUSS_SCRDIR=/scratch/lt200439-sensor/$USER/$SLURM_JOB_ID
g16 < $WORKDIR/$FILENAME.gjf > $WORKDIR/$FILENAME.log
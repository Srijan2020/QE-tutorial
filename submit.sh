#!/bin/bash

#SBATCH --account=ucb269_asc3
#SBATCH --partition=atesting
#SBATCH --qos=testing
#SBATCH --nodes=1
#SBATCH --ntasks=12
#SBATCH --ntasks-per-node=12
#SBATCH --output=test.%j.out
#SBATCH --time=1:00:00

module purge
module load intel/2022.1.2
module load impi
module load QE/7.2

export BIN_LIST="pw.x: bands.x"  #pw.x, dos.x
export EXAMPLE_DIR=$PWD
export BIN_DIR=$CURC_QE_BIN
export TMP_DIR=$SLURM_SCRATCH


#mpirun -np $SLURM_NTASKS $BIN_DIR/pw.x < pwscf.in > pwscf.out
#mpirun -np $SLURM_NTASKS $BIN_DIR/pw.x < pwbands.in > pwbands.out
mpirun -np $SLURM_NTASKS $BIN_DIR/bands.x < pp.bands.in > pp.bands.out


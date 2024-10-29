#!/bin/bash
#SBATCH --job-name=diffusion_job          # Job name
#SBATCH --output=diffusion_output.log     # File to which STDOUT will be written
#SBATCH --error=diffusion_error.log       # File to which STDERR will be written
#SBATCH --gres=gpu:1                      # Request 1 GPU
#SBATCH --nodes=1                         # Request 10 nodes
#SBATCH --time=1-00:00:00                 # Time limit (1 day)
#SBATCH --partition=gpu                   # Partition name
#SBATCH --ntasks=1                        # Number of tasks (processes)
#SBATCH --mem=32G                         # Memory per node

ml Singularity
ml CUDA

HYDRA_FULL_ERROR=1

singularity exec --nv --writable-tmpfs \
--bind /nemo/lab/froehlichf/home/users/pomeret:/mnt \
--env PYTHONPATH=/mnt/DiGress \
diffusion.sif \
pwd 
python3 /mnt/DiGress/src/main.py dataset=symbolic +experiment=symbolic.yaml
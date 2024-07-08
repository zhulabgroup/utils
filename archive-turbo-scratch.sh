#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=21
#SBATCH --mem-per-cpu=8g
#SBATCH --time=24:00:00
#SBATCH --account=zhukai0
#SBATCH --partition=standard
#SBATCH --mail-type=BEGIN,END

cd /nfs/turbo/seas-zhukai/archives/${AF}
module load archivetar
archivetar --prefix ${AF} --zstd --bundle-path /scratch/zhukai_root/zhukai0/${UN} --size 100G

# Download this bash script to your home directory
# Make it executable
# chmod +x archive-turbo-scratch.sh
# Use it with the following command
# sbatch --export=AF=<target folder> --export=UN=<unique name> --job-name=<job name> archive-turbo-scratch.sh

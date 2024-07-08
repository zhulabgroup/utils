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
archivetar --prefix ${AF} --zstd --bundle-path /scratch/zhukai_root/zhukai0/${UN} --destination-dir /nfs/dataden/seas-zhukai/${AF} --rm-at-files

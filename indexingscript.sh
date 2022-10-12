#!/bin/bash --login
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=100GB
#SBATCH --job-name run_fastqc
#SBATCH --output=%x-%j.SLURMout

#change to current working directory

cd ${PBS_O_WORKDIR}

#Add conda(fastqc) environment to path

export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export PATH2="${HOME}/thadaraj/fasta_gff/fa_gff:${PATH2}"
export LD_LIBRARY_PATH="${HOME}//envs/plb812/lib:${LD_LIBRARY_PATH}"

  STAR --runThreadN 16 --runMode genomeGenerate --genomeDir index/ --genomeFastaFiles BdistachyonABR4_364_v1.softmasked.fa --sjdbGTFfile Bdistachyon.gtf --genomeSAindexNbases 13 --sjdbGTFtagExonParentTranscript Parent --sjdbOverhang 149
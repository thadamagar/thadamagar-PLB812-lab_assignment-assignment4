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
export PATH2="${HOME}/thadaraj/fastqcopied:${PATH2}"
export PATH2="${HOME}/thadaraj/fasta_gff/fa_gff/index:${PATH2}"
export LD_LIBRARY_PATH="${HOME}//envs/plb812/lib:${LD_LIBRARY_PATH}"

#code to change fastq to fastqc file

fastq_list="SRR8618244 SRR8618245 SRR8618246 SRR8618247 SRR8618248 SRR8618249 SRR8618250 SRR8618251 SRR8618252 SRR8618253 SRR8618254 SRR8618255 SRR8618256 SRR8618257 SRR8618258"

for i in ${fastq_list}
do
   STAR --runThreadN 10 --runMode alignReads --genomeDir  /mnt/home/thadaraj/fasta_gff/fa_gff/index --quantMode GeneCounts --outSAMtype BAM SortedByCoordinate --readFilesIn ${i}_1.fastq ${i}_2.fastq --out
FileNamePrefix /mnt/home/thadaraj/mapped/${i}_1 /mnt/home/thadaraj/mapped/${i}_2
done
# vitcomic2 local
The stand-alone version of VITCOMIC2 (http://vitcomic.org/).

Before VITCOMIC2, we recommend you to conduct quality filtering of reads.

download and install fastp https://github.com/OpenGene/fastp

download and install bwa https://sourceforge.net/projects/bio-bwa/files/

download and install seqkit https://github.com/shenwei356/seqkit

Lazy way to conduct VITCOMIC2

Download a tar.gz file from http://palaeo.nig.ac.jp/Resources/VITCOMIC/
This file contains all of required files from VITCOMIC2 execution.

WorkFlow is
fastp --> seqkit --> mapseq 

Put all VITCOMIC2 local files and a MAPseq binary file, a fastp binary file, a seqkit binary file symbolic links in the working directory.
Then, conduct a shell script.

VITCOMIC2MDB3ver.sh
```bash
for i in *.fastq;do
fastp -i "$i" -o "$i".rem.fastq -G -3 -n 1 -l 90 -w 1 -x
seqkit fq2fa "$i".rem.fastq -o "$i".rem.fa
mapseq "$i".rem.fa RDP_BacArc.fasta.one.1200.3000.uniq.rem RDP_BacArc.fasta.one.1200.3000.mapseq > "$i".rem.fa.mapseq
perl Parse_Single "$i".rem.fa.mapseq
perl PileupGeneraMDB "$i".rem.fa.mapseq.parsed
perl MimicClusterForNewMDB "$i".rem.fa.mapseq.parsed.genus.m16s Refs_14_04_11.SPlist.Pro.txt
done
```

You can get
* a m16s file
* a cluster file

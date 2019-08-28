# vitcomic2 local
The stand-alone version of VITCOMIC2 (http://vitcomic.org/).

Before VITCOMIC2, we recommend you to conduct quality filtering of reads.

download and install fastp https://github.com/OpenGene/fastp

download and install bwa https://sourceforge.net/projects/bio-bwa/files/

Quality filtering example:

```bash
bwa index -a bwtsw phiX174.fasta
vi QFtest.sh
for i in *.fastq;do
bwa mem phiX174.fasta $i> $i.sam
perl RemovePhiHu.pl $i $i.sam
fastp -i $i.rem.fastq -o $i.rem2.fastq -G -3 -n 1 -l 90 -w 1 -x
fastp -i $i.rem2.fastq -o $i.rem3.fastq -G -3 -n 1 -l 90 -w 1 -a ATGCCGTCTTCTGCTTG
fastp -i $i.rem3.fastq -o $i.rem4.fastq -G -3 -n 1 -l 90 -w 1 -a GAGACTAAGGCGAATCTCGT
fastp -i $i.rem4.fastq -o $i.rem5.fastq -G -3 -n 1 -l 90 -w 1 -a CTGTCTCTTATACACATCTC
done
```

After that, conduct VITCOMIC2.


1. download and install MAPseq from https://github.com/jfmrod/MAPseq
2. gunzip

Or you can use MAPseq binary file in the VITCOMIC2 repository.
```bash
chmod a+rwx mapseq
```

gunzip Refs_14_04_11.fasta.one.fa.dup.gz
3. Put all VITCOMIC2 local files and a MAPseq binary file symbolic link in the current directory
4. If input files are fastq,

```bash
vi VITCOMIC2LocalFASTQ.sh
for i in *.fastq;do
sed '/^@[A-Z][A-Z0-9]/!d;s//>/;N' "$i" > "$i".fa
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' "$i".fa > "$i".fa.one.fa
./mapseq "$i".fa.one.fa Refs_14_04_11.fasta.one.fa.dup Refs_14_04_11.SPlist.Pro.txt.mapseq > "$i".fa.one.fa.mapseq
perl Parse_Single.pl "$i".fa.one.fa.mapseq
perl PileupGenera.pl "$i".fa.one.fa.mapseq.parsed
perl MimicCluster.pl "$i".fa.one.fa.mapseq.parsed.genus.txt Refs_14_04_11.SPlist.Pro.txt
done
```
Please be careful, above sed command is not perfect.
In some fastq files, this code will cause problems.
If your fastq files are derived from INSDC DRA/ERA/SRA, 
replace above sed line to
```bash
sed '/^[DES]RR[0-9]/!d;s//>/;N' "$i" > "$i".fa
```
Otherwise, you can use
```bash
perl FASTQFASTA.pl "$i"
```

5. If input files are fasta,
```bash
vi VITCOMIC2LocalFASTA.sh
for i in *.fasta;do
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' "$i" > "$i".one.fa
./mapseq "$i".one.fa Refs_14_04_11.fasta.one.fa.dup Refs_14_04_11.SPlist.Pro.txt.mapseq > "$i".one.fa.mapseq
perl Parse_Single.pl "$i".one.fa.mapseq
perl PileupGenera.pl "$i".one.fa.mapseq.parsed
perl MimicCluster.pl "$i".one.fa.mapseq.parsed.genus.txt Refs_14_04_11.SPlist.Pro.txt
done
```


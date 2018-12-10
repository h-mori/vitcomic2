# vitcomic2
The stand-alone version of VITCOMIC2 (http://vitcomic.org/).

1. download and install MAPseq from https://github.com/jfmrod/MAPseq
2. gunzip
gunzip Refs_14_04_11.fasta.one.fa.dup.gz
3. Put all VITCOMIC2 local files in the current directory
4. If input files are fastq,

vi VITCOMIC2LocalFASTQ.sh
for i in *.fastq;do
sed '/^@[A-Z][A-Z0-9]/!d;s//>/;N' "$i" > "$i".fa
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' "$i".fa > "$i".fa.one.fa
./mapseq "$i".fa.one.fa Refs_14_04_11.fasta.one.fa.dup Refs_14_04_11.SPlist.Pro.txt.mapseq > "$i".fa.one.fa.mapseq
perl Parse_Single.pl "$i".fa.one.fa.mapseq
perl PileupGenera.pl "$i".fa.one.fa.mapseq.parsed
perl MimicCluster.pl "$i".fa.one.fa.mapseq.parsed.genus.txt Refs_14_04_11.SPlist.Pro.txt
done

5. If input files are fasta,

vi VITCOMIC2LocalFASTA.sh
for i in *.fasta;do
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' "$i" > "$i".one.fa
./mapseq "$i".one.fa Refs_14_04_11.fasta.one.fa.dup Refs_14_04_11.SPlist.Pro.txt.mapseq > "$i".one.fa.mapseq
perl Parse_Single.pl "$i".one.fa.mapseq
perl PileupGenera.pl "$i".one.fa.mapseq.parsed
perl MimicCluster.pl "$i".one.fa.mapseq.parsed.genus.txt Refs_14_04_11.SPlist.Pro.txt
done

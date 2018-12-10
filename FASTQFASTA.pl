#! /usr/local/bin/perl -w

#Last modified date: June 14, 2014
#This program was written by Hiroshi Mori
#FASTQFASTA.pl by Hiroshi Mori is licensed under a Creative Commons Attribution ShareAlike 2.1 Japan license (c)
# IN NO EVENT SHALL THE AUTHOR OF THIS PROGRAM BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS PROGRAM, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#Usage: perl FASTQFASTA.pl FASTQFile
#Example: perl FASTQFASTA.pl Test.fastq.N.rem.aqv.25

use warnings;
use strict;

my ($input, $output, $counter, $temp, $divless, $seqname) = 0;

$input = $ARGV[0];
open(INPUT, "$input") or die "Can't open \"$input\"\n";

$output = "$input.fasta";
open(OUTPUT, ">$output") or die "Can't open \"$output\"\n";

$counter = 0;
open(INPUT, "$input") or die "Can't open \"$input\"\n";
while(<INPUT>){
	if(/^(\S.*?)\s*$/){
		$counter += 1;
		$temp = $1;
		$divless = $counter % 4;
		if($divless == 1){
			if($temp =~ /^\@(.+?)$/){
				$seqname = $1;
			}
		}
		elsif($divless == 2){
            if($temp =~ /^(\S+)\s*$/){
				print OUTPUT ">$seqname\n$1\n";
			}
		}
	}
}
close INPUT;
close OUTPUT;
exit;

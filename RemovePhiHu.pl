#! /usr/bin/perl -w

use warnings;
use strict;

my ($input, $input2, $output, $counter, $ok, $seqname, $all, $divless) = 0;
my (@ar) = ();
my (%id_Hash) = ();

$input = $ARGV[0];
open(INPUT, "$input") or die "Can't open \"$input\"\n";

$input2 = $ARGV[1];
open(INPUT2, "$input2") or die "Can't open \"$input2\"\n";

$output = "$input.rem.fastq";
open(OUTPUT, ">$output") or die "Can't open \"$output\"\n";


open(INPUT2, "$input2") or die "Can't open \"$input2\"\n";
while(<INPUT2>){
    if(/^(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\d+[A-Z]\S*\s+/){
        $id_Hash{$1} = 1;
	}
}
close INPUT2;

$counter = 0;
$ok = 1;
open(INPUT, "$input") or die "Can't open \"$input\"\n";
while(<INPUT>){
    if(/^((\S+).*?)$/){
        $counter += 1;
        $seqname = $2;
        $all = $1;
        $divless = $counter % 4;
        if($divless == 1){
            if($seqname =~ /^\S(\S+)/){
                if(exists($id_Hash{$1})){
                    $ok = 1;
                    next;
                }
                else{
                    $ok = 2;
                    print OUTPUT "$all\n";
                }
            }
        }
        elsif($divless == 2){
            if($ok == 2){
                print OUTPUT "$all\n";
            }
            else{
                next;
            }
        }
        elsif($divless == 3){
            if($ok == 2){
                print OUTPUT "$all\n";
            }
            else{
                next;
            }
        }
        elsif($divless == 0){
            if($ok == 2){
                print OUTPUT "$all\n";
            }
            else{
                next;
            }
        }
    }
}
close INPUT;
close OUTPUT;
exit;



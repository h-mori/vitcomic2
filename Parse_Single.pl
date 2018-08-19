#! /usr/local/bin/perl -w

use warnings;
use strict;

my ($input, $output) = 0;
my (%query_Hash) = ();

$input = $ARGV[0];
open(INPUT, "$input") or die "Can't open \"$input\"\n";

$output = "$input.parsed";
open(OUTPUT, ">$output") or die "Can't open \"$output\"\n";

open(INPUT, "$input") or die "Can't open \"$input\"\n";
while(<INPUT>){
	if(/^(\S+)(\s+\S.+?\S)\s*$/){
		if(exists($query_Hash{$1})){
			next;
		}
		else{
			$query_Hash{$1} = $2;
			print OUTPUT "$1$2\n";
		}
	}
}
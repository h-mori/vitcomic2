use warnings;
use strict;

my ($input, $output, $ref, $one, $genus, $two) = 0;
my (%genus_Hash, %add_Hash) = ();

$input = $ARGV[0];
open(INPUT, "$input") or die "Can't open \"$input\"\n";

$ref = $ARGV[1];
open(REF, "$ref") or die "Can't open \"$ref\"\n";

$output = "$input.cluster";
open(OUTPUT, ">$output") or die "Can't open \"$output\"\n";

open(REF, "$ref") or die "Can't open \"$ref\"\n";
while(<REF>){
    if(/^(\S+)\t+\S.+?\t+(\S.+?)\t+(\S.+?)\s*$/){
        $one = $1;
        $genus = $2;
        $two = $3;
        $genus_Hash{$genus} = $one;
        $add_Hash{$genus} = $two;
    }
}
close REF;

open(INPUT, "$input") or die "Can't open \"$input\"\n";
while(<INPUT>){
    if(/^(\S.+?)\t+(\d+)\s*$/){
        if(exists($genus_Hash{$1})){
                print OUTPUT "$genus_Hash{$1} $add_Hash{$1}\t95\t$2.000000\n";
        }
        else{
            $genus = $1;
            $two = $2;
            if($genus =~ /Pedobacter/){
                $genus = "Pedobacter";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Sphingorhabdus/){
                $genus = "Sphingopyxis";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Stenotrophobacter/){
                $genus = "Gp4";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Aetherobacter/){
                $genus = "Byssovorax";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Aquipuribacter/){
                next;
            }
            elsif($genus =~ /Aridibacter/){
                $genus = "Gp4";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Armatimonas/){
                $genus = "Armatimonas\/Armatimonadetes_gp1";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Blastocatella/){
                $genus = "Gp4";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Chamaesiphon/){
                $genus = "GpI";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Chloronema/){
                next;
            }
            elsif($genus =~ /Chthoniobacter/){
                $genus = "Spartobacteria_genera_incertae_sedis";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Chthonomonas/){
                $genus = "Chthonomonas\/Armatimonadetes_gp3";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Geitlerinema_g1/){
                $genus = "GpI";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Labilithrix/){
                next;
            }
            elsif($genus =~ /Leptolyngbya_g2/){
                $genus = "GpIIa";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Limnothrix/){
                $genus = "GpIV";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Methylibium/){
                next;
            }
            elsif($genus =~ /Microcoleus/){
                $genus = "GpXIII";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Oscillochloris/){
                next;
            }
            elsif($genus =~ /Polymorphobacter/){
                next;
            }
            elsif($genus =~ /Rubrivirga/){
                next;
            }
            elsif($genus =~ /Saccharimonas/){
                $genus = "TM7_genera_incertae_sedis";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Saccharimonas/){
                $genus = "TM7_genera_incertae_sedis";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Tabrizicola/){
                $genus = "Gemmobacter";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Tabrizicola/){
                $genus = "Gemmobacter";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Paradevosia/){
                $genus = "Devosia";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Rugamonas/){
                $genus = "Massilia";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Clostridium/){
                $genus = "Clostridium sensu stricto";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Sinorhodobacter/){
                $genus = "Rhodobacter";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Acidicapsa/){
                $genus = "Gp1";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Roseiarcus/){
                $genus = "Gp3";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Limisphaera/){
                $genus = "Subdivision3_genera_incertae_sedis";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Solibacter/){
                $genus = "Gp3";
                print OUTPUT "$genus_Hash{$genus} $add_Hash{$genus}\t95\t$two.000000\n";
            }
            elsif($genus =~ /Galbitalea/){
                next;
            }
            elsif($genus =~ /Tepidisphaera/){
                next;
            }
            elsif($genus =~ /Parablastomonas/){
                next;
            }
            elsif($genus =~ /Zhizhongheella/){
                next;
            }
            elsif($genus =~ /Lysinimonas/){
                next;
            }
            elsif($genus =~ /Actimicrobium/){
                next;
            }
            elsif($genus =~ /Actimicrobium/){
                next;
            }
            elsif($genus =~ /Defluviimonas/){
                next;
            }
            elsif($genus =~ /Pseudohongiella/){
                next;
            }
            elsif($genus =~ /Accumulibacter/){
                next;
            }
            elsif($genus =~ /Roseiarcus/){
                next;
            }
            elsif($genus =~ /Nitrotoga/){
                next;
            }
            elsif($genus =~ /Frondihabitans/){
                next;
            }
            elsif($genus =~ /Parasediminibacterium/){
                next;
            }
            elsif($genus =~ /Planktophila/){
                next;
            }
            elsif($two >= 300){
                print "$genus\t$two\n";
            }
        }
    }
}
close INPUT;
close OUTPUT;
exit;


#!/usr/bin/perl
#give the folder name, that has to be processed after the program name
#It saves the results into a  new folder named StopCodon (as in line 11)
#creates total five files..CSSR-gene,CSSR-nongene,Gene,NOngene,stopcodon
print "Hello World \n";

# indicate the path of the folder below inside the parantheses.. for example "/Desktop/PerlforCSSR/genomeInput/"
$path = "/home/quangmt/Documents/PerlforCSSR4/genomeInput/";

opendir(IMD, $path) || die("Cannot open directory");

@files= readdir(IMD);
closedir(IMD);

mkdir "/home/quangmt/Documents/PerlforCSSR4/Result1";

my $codon = "";
my @readingFrame = (
[0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,],
[0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,],
[0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,]
);
my ($AAA1,$AAA2,$AAA3,$AAC1,$AAC2,$AAC3,$AAG1,$AAG2,$AAG3,	$AAT1,	$AAT2,	$AAT3,	$ACA1,	$ACA2,	$ACA3,	$ACC1,	$ACC2,	$ACC3,	$ACG1,	$ACG2,	$ACG3,	$ACT1,	$ACT2,	$ACT3,	$AGA1,	$AGA2,	$AGA3,	$AGC1,	$AGC2,	$AGC3,	$AGG1,	$AGG2,	$AGG3,	$AGT1,	$AGT2,	$AGT3,	$ATA1,	$ATA2,	$ATA3,	$ATC1,	$ATC2,	$ATC3,	$ATG1,	$ATG2,	$ATG3,	$ATT1,	$ATT2,	$ATT3,	$CAA1,	$CAA2,	$CAA3,	$CAC1,	$CAC2,	$CAC3,	$CAG1,	$CAG2,	$CAG3,	$CAT1,	$CAT2,	$CAT3,	$CCA1,	$CCA2,	$CCA3,	$CCC1,	$CCC2,	$CCC3,	$CCG1,	$CCG2,	$CCG3,	$CCT1,	$CCT2,	$CCT3,	$CGA1,	$CGA2,	$CGA3,	$CGC1,	$CGC2,	$CGC3,	$CGG1,	$CGG2,	$CGG3,	$CGT1,	$CGT2,	$CGT3,	$CTA1,	$CTA2,	$CTA3,	$CTC1,	$CTC2,	$CTC3,	$CTG1,	$CTG2,	$CTG3,	$CTT1,	$CTT2,	$CTT3,	$GAA1,	$GAA2,	$GAA3,	$GAC1,	$GAC2,	$GAC3,	$GAG1,	$GAG2,	$GAG3,	$GAT1,	$GAT2,	$GAT3,	$GCA1,	$GCA2,	$GCA3,	$GCC1,	$GCC2,	$GCC3,	$GCG1,	$GCG2,	$GCG3,	$GCT1,	$GCT2,	$GCT3,	$GGA1,	$GGA2,	$GGA3,	$GGC1,	$GGC2,	$GGC3,	$GGG1,	$GGG2,	$GGG3,	$GGT1,	$GGT2,	$GGT3,	$GTA1,	$GTA2,	$GTA3,	$GTC1,	$GTC2,	$GTC3,	$GTG1,	$GTG2,	$GTG3,	$GTT1,	$GTT2,	$GTT3,	$TAA1,	$TAA2,	$TAA3,	$TAC1,	$TAC2,	$TAC3,	$TAG1,	$TAG2,	$TAG3,	$TAT1,	$TAT2,	$TAT3,	$TCA1,	$TCA2,	$TCA3,	$TCC1,	$TCC2,	$TCC3,	$TCG1,	$TCG2,	$TCG3,	$TCT1,	$TCT2,	$TCT3,	$TGA1,	$TGA2,	$TGA3,	$TGC1,	$TGC2,	$TGC3,	$TGG1,	$TGG2,	$TGG3,	$TGT1,	$TGT2,	$TGT3,	$TTA1,	$TTA2,	$TTA3,	$TTC1,	$TTC2,	$TTC3,	$TTG1,	$TTG2,	$TTG3,	$TTT1,	$TTT2,	$TTT3,		) = 0;

$count = 0;
for($n=0;$n<scalar(@files);$n++)
{
    $count = 0;
    for($i=0;$i<scalar(@files);$i++)
    {
        if($files[$n] eq $files[$i])
        {
            $count++;
            if ($count > 1)
            {
                $files[$i] = $files[$i] . "-$count";
            }
        }
    }
}

print "Count: ", $count, " \n";

foreach $file (@files)
{

    unless ( ($file eq ".") || ($file eq "..") )
    {
        open (READFILE, "< $path/$file") or die "can't open file";
        my @rawGene=<READFILE>;
        close(READFILE);

        print @rawGene, "\n";

        my $genes = "";
        my @geneName = ();
        my @newData = ();
        my $genecounter = -1;
        for($i=0;$i<scalar(@rawGene);$i++)
        {
           chomp $rawGene[$i];
           next if $rawGene[$i]=~/^$/;
           if($rawGene[$i] =~ ">" || $rawGene[$i] =~ "/+/")
           {
              $genecounter++;
              $newData[$genecounter] = "";
              $geneName[$genecounter] = $rawGene[$i];
           }
           else
           {
              $newData[$genecounter] = $newData[$genecounter] . $rawGene[$i];
           }
        }

        print $genecounter, "\n";
        print $newData[0], "\n";
        print $geneName[0], "\n";

        exit;

        open (WriteFile, ">>  /home/quangmt/Documents/PerlforCSSR4/Result1/" . $file);
        print WriteFile  "Gene ID \tAAA1\tAAC1\tAAG1\tAAT1\tACA1\tACC1\tACG1\tACT1\tAGA1\tAGC1\tAGG1\tAGT1\tATA1\tATC1\tATG1\tATT1\tCAA1\tCAC1\tCAG1\tCAT1\tCCA1\tCCC1\tCCG1\tCCT1\tCGA1\tCGC1\tCGG1\tCGT1\tCTA1\tCTC1\tCTG1\tCTT1\tGAA1\tGAC1\tGAG1\tGAT1\tGCA1\tGCC1\tGCG1\tGCT1\tGGA1\tGGC1\tGGG1\tGGT1\tGTA1\tGTC1\tGTG1\tGTT1\tTAA1\tTAC1\tTAG1\tTAT1\tTCA1\tTCC1\tTCG1\tTCT1\tTGA1\tTGC1\tTGG1\tTGT1\tTTA1\tTTC1\tTTG1	\tTTT1" .
"\tAAA2\tAAC2\tAAG2\tAAT2\tACA2\tACC2\tACG2\tACT2\tAGA2\tAGC2\tAGG2\tAGT2\tATA2\tATC2\tATG2\tATT2\tCAA2\tCAC2\tCAG2\tCAT2\tCCA2\tCCC2\tCCG2\tCCT2\tCGA2\tCGC2\tCGG2\tCGT2\tCTA2\tCTC2\tCTG2\tCTT2\tGAA2\tGAC2\tGAG2\tGAT2\tGCA2\tGCC2\tGCG2\tGCT2\tGGA2\tGGC2\tGGG2\tGGT2\tGTA2\tGTC2\tGTG2\tGTT2\tTAA2\tTAC2\tTAG2\tTAT2\tTCA2\tTCC2\tTCG2\tTCT2\tTGA2\tTGC2\tTGG2\tTGT2\tTTA2\tTTC2\tTTG2\tTTT2" .
"\tAAA3\tAAC3\tAAG3\tAAT3\tACA3\tACC3\tACG3\tACT3\tAGA3\tAGC3\tAGG3\tAGT3\tATA3\tATC3\tATG3\tATT3\tCAA3\tCAC3\tCAG3\tCAT3\tCCA3\tCCC3\tCCG3\tCCT3\tCGA3\tCGC3\tCGG3\tCGT3\tCTA3\tCTC3\tCTG3\tCTT3\tGAA3\tGAC3\tGAG3\tGAT3\tGCA3\tGCC3\tGCG3\tGCT3\tGGA3\tGGC3\tGGG3\tGGT3\tGTA3\tGTC3\tGTG3\tGTT3\tTAA3\tTAC3\tTAG3\tTAT3\tTCA3\tTCC3\tTCG3\tTCT3\tTGA3\tTGC3\tTGG3\tTGT3\tTTA3\tTTC3\tTTG3\tTTT3\n" ;

#"\tAAA2	\tAAC2	\tAAG2	\tAAT2	\tACA2	\tACC2	\tACG2	\tACT2	\tAGA2	\tAGC2	\tAGG2	\tAGT2	\tATA2	\tATC2	\tATG2	\tATT2	\tCAA2	\tCAC2	\tCAG2	\tCAT2	\tCCA2	\tCCC2	\tCCG2	\tCCT2	\tCGA2	\tCGC2	\tCGG2	\tCGT2	\tCTA2	\tCTC2	\tCTG2	\tCTT2	\tGAA2	\tGAC2	\tGAG2	\tGAT2	\tGCA2	\tGCC2	\tGCG2	\tGCT2	\tGGA2	\tGGC2	\tGGG2	\tGGT2	\tGTA2	\tGTC2	\tGTG2	\tGTT2	\tTAA2	\tTAC2	\tTAG2	\tTAT2	\tTCA2	\tTCC2	\tTCG2	\tTCT2	\tTGA2	\tTGC2	\tTGG2	\tTGT2	\tTTA2	\tTTC2	\tTTG2	\tTTT2   " .

#"\tAAA3	\tAAC3	\tAAG3	\tAAT3	\tACA3	\tACC3	\tACG3	\tACT3	\tAGA3	\tAGC3	\tAGG3	\tAGT3	\tATA3	\tATC3	\tATG3	\tATT3	\tCAA3	\tCAC3	\tCAG3	\tCAT3	\tCCA3	\tCCC3	\tCCG3	\tCCT3	\tCGA3	\tCGC3	\tCGG3	\tCGT3	\tCTA3	\tCTC3	\tCTG3	\tCTT3	\tGAA3	\tGAC3	\tGAG3	\tGAT3	\tGCA3	\tGCC3	\tGCG3	\tGCT3	\tGGA3	\tGGC3	\tGGG3	\tGGT3	\tGTA3	\tGTC3	\tGTG3	\tGTT3	\tTAA3	\tTAC3	\tTAG3	\tTAT3	\tTCA3	\tTCC3	\tTCG3	\tTCT3	\tTGA3	\tTGC3	\tTGG3	\tTGT3	\tTTA3	\tTTC3	\tTTG3	\tTTT3\n";


        for($n=0;$n<scalar(@newData);$n++)
        {
            @charArray =  split(//,$newData[$n]);

            for($i=0;$i<scalar(@charArray);$i++)
            {
                $charArray[$i] =  &randomAssign($charArray[$i]);
            }
            $newData[$n] = "@charArray";
            $newData[$n] =~ s/(.)\s/$1/seg;
        }

        open (WriteFileGene, ">> /home/quangmt/Documents/PerlforCSSR4/Result1/" . $file . "-FASTA.txt");
        open (WriteFileCSSRGene, ">> /home/quangmt/Documents/PerlforCSSR4/Result1/" . $file . "-CSSRGene.txt");
        print WriteFileCSSRGene
"Gene ID \tAAA1	\tAAC1	\tAAG1	\tAAT1	\tACA1	\tACC1	\tACG1	\tACT1	\tAGA1	\tAGC1	\tAGG1	\tAGT1	\tATA1	\tATC1	\tATG1	\tATT1	\tCAA1	\tCAC1	\tCAG1	\tCAT1	\tCCA1	\tCCC1	\tCCG1	\tCCT1	\tCGA1	\tCGC1	\tCGG1	\tCGT1	\tCTA1	\tCTC1	\tCTG1	\tCTT1	\tGAA1	\tGAC1	\tGAG1	\tGAT1	\tGCA1	\tGCC1	\tGCG1	\tGCT1	\tGGA1	\tGGC1	\tGGG1	\tGGT1	\tGTA1	\tGTC1	\tGTG1	\tGTT1	\tTAA1	\tTAC1	\tTAG1	\tTAT1	\tTCA1	\tTCC1	\tTCG1	\tTCT1	\tTGA1	\tTGC1	\tTGG1	\tTGT1	\tTTA1	\tTTC1	\tTTG1	\tTTT1" .

"\tAAA2	\tAAC2	\tAAG2	\tAAT2	\tACA2	\tACC2	\tACG2	\tACT2	\tAGA2	\tAGC2	\tAGG2	\tAGT2	\tATA2	\tATC2	\tATG2	\tATT2	\tCAA2	\tCAC2	\tCAG2	\tCAT2	\tCCA2	\tCCC2	\tCCG2	\tCCT2	\tCGA2	\tCGC2	\tCGG2	\tCGT2	\tCTA2	\tCTC2	\tCTG2	\tCTT2	\tGAA2	\tGAC2	\tGAG2	\tGAT2	\tGCA2	\tGCC2	\tGCG2	\tGCT2	\tGGA2	\tGGC2	\tGGG2	\tGGT2	\tGTA2	\tGTC2	\tGTG2	\tGTT2	\tTAA2	\tTAC2	\tTAG2	\tTAT2	\tTCA2	\tTCC2	\tTCG2	\tTCT2	\tTGA2	\tTGC2	\tTGG2	\tTGT2	\tTTA2	\tTTC2	\tTTG2	\tTTT2   " .

"\tAAA3	\tAAC3	\tAAG3	\tAAT3	\tACA3	\tACC3	\tACG3	\tACT3	\tAGA3	\tAGC3	\tAGG3	\tAGT3	\tATA3	\tATC3	\tATG3	\tATT3	\tCAA3	\tCAC3	\tCAG3	\tCAT3	\tCCA3	\tCCC3	\tCCG3	\tCCT3	\tCGA3	\tCGC3	\tCGG3	\tCGT3	\tCTA3	\tCTC3	\tCTG3	\tCTT3	\tGAA3	\tGAC3	\tGAG3	\tGAT3	\tGCA3	\tGCC3	\tGCG3	\tGCT3	\tGGA3	\tGGC3	\tGGG3	\tGGT3	\tGTA3	\tGTC3	\tGTG3	\tGTT3	\tTAA3	\tTAC3	\tTAG3	\tTAT3	\tTCA3	\tTCC3	\tTCG3	\tTCT3	\tTGA3	\tTGC3	\tTGG3	\tTGT3	\tTTA3	\tTTC3	\tTTG3	\tTTT3\n";

        open (WriteFileNonGene, ">> /home/quangmt/Documents/PerlforCSSR4/Result1/" . $file . "-offseqgene.txt");
        open (WriteFileCSSRNonGene, ">> /home/quangmt/Documents/PerlforCSSR4/Result1/" . $file . "-CSSRNonGene.txt");
        print WriteFileCSSRNonGene
"Gene ID \tAAA1	\tAAC1	\tAAG1	\tAAT1	\tACA1	\tACC1	\tACG1	\tACT1	\tAGA1	\tAGC1	\tAGG1	\tAGT1	\tATA1	\tATC1	\tATG1	\tATT1	\tCAA1	\tCAC1	\tCAG1	\tCAT1	\tCCA1	\tCCC1	\tCCG1	\tCCT1	\tCGA1	\tCGC1	\tCGG1	\tCGT1	\tCTA1	\tCTC1	\tCTG1	\tCTT1	\tGAA1	\tGAC1	\tGAG1	\tGAT1	\tGCA1	\tGCC1	\tGCG1	\tGCT1	\tGGA1	\tGGC1	\tGGG1	\tGGT1	\tGTA1	\tGTC1	\tGTG1	\tGTT1	\tTAA1	\tTAC1	\tTAG1	\tTAT1	\tTCA1	\tTCC1	\tTCG1	\tTCT1	\tTGA1	\tTGC1	\tTGG1	\tTGT1	\tTTA1	\tTTC1	\tTTG1	\tTTT1" .

"\tAAA2	\tAAC2	\tAAG2	\tAAT2	\tACA2	\tACC2	\tACG2	\tACT2	\tAGA2	\tAGC2	\tAGG2	\tAGT2	\tATA2	\tATC2	\tATG2	\tATT2	\tCAA2	\tCAC2	\tCAG2	\tCAT2	\tCCA2	\tCCC2	\tCCG2	\tCCT2	\tCGA2	\tCGC2	\tCGG2	\tCGT2	\tCTA2	\tCTC2	\tCTG2	\tCTT2	\tGAA2	\tGAC2	\tGAG2	\tGAT2	\tGCA2	\tGCC2	\tGCG2	\tGCT2	\tGGA2	\tGGC2	\tGGG2	\tGGT2	\tGTA2	\tGTC2	\tGTG2	\tGTT2	\tTAA2	\tTAC2	\tTAG2	\tTAT2	\tTCA2	\tTCC2	\tTCG2	\tTCT2	\tTGA2	\tTGC2	\tTGG2	\tTGT2	\tTTA2	\tTTC2	\tTTG2	\tTTT2   " .

"\tAAA3	\tAAC3	\tAAG3	\tAAT3	\tACA3	\tACC3	\tACG3	\tACT3	\tAGA3	\tAGC3	\tAGG3	\tAGT3	\tATA3	\tATC3	\tATG3	\tATT3	\tCAA3	\tCAC3	\tCAG3	\tCAT3	\tCCA3	\tCCC3	\tCCG3	\tCCT3	\tCGA3	\tCGC3	\tCGG3	\tCGT3	\tCTA3	\tCTC3	\tCTG3	\tCTT3	\tGAA3	\tGAC3	\tGAG3	\tGAT3	\tGCA3	\tGCC3	\tGCG3	\tGCT3	\tGGA3	\tGGC3	\tGGG3	\tGGT3	\tGTA3	\tGTC3	\tGTG3	\tGTT3	\tTAA3	\tTAC3	\tTAG3	\tTAT3	\tTCA3	\tTCC3	\tTCG3	\tTCT3	\tTGA3	\tTGC3	\tTGG3	\tTGT3	\tTTA3	\tTTC3	\tTTG3	\tTTT3\n";


        for($n=0;$n<scalar(@newData);$n++)
        {
            @readingFrame = (
[0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,],
[0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,],
[0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,]
);

		for($i=0;$i<length($newData[$n]);$i=$i+3)
            {
                &checkCodon(substr($newData[$n], $i, 3), 0);
            }

            for($i=1;$i<length($newData[$n]);$i=$i+3)
            {
                &checkCodon(substr($newData[$n], $i, 3), 1);
            }

            for($i=2;$i<length($newData[$n]);$i=$i+3)
            {
                &checkCodon(substr($newData[$n], $i, 3), 2);
            }

            print WriteFile
"$geneName[$n]\t$readingFrame[0][0]\t$readingFrame[0][1]\t$readingFrame[0][2]\t$readingFrame[0][3]\t$readingFrame[0][4]\t$readingFrame[0][5]\t$readingFrame[0][6]\t$readingFrame[0][7]\t$readingFrame[0][8]\t$readingFrame[0][9]\t$readingFrame[0][10]\t$readingFrame[0][11]\t$readingFrame[0][12]\t$readingFrame[0][13]\t$readingFrame[0][14]\t$readingFrame[0][15]\t$readingFrame[0][16]\t$readingFrame[0][17]\t$readingFrame[0][18]\t$readingFrame[0][19]\t$readingFrame[0][20]\t$readingFrame[0][21]\t$readingFrame[0][22]\t$readingFrame[0][23]\t$readingFrame[0][24]\t$readingFrame[0][25]\t$readingFrame[0][26]\t$readingFrame[0][27]\t$readingFrame[0][28]\t$readingFrame[0][29]\t$readingFrame[0][30]\t$readingFrame[0][31]\t$readingFrame[0][32]\t$readingFrame[0][33]\t$readingFrame[0][34]\t$readingFrame[0][35]\t$readingFrame[0][36]\t$readingFrame[0][37]\t$readingFrame[0][38]\t$readingFrame[0][39]\t$readingFrame[0][40]\t$readingFrame[0][41]\t$readingFrame[0][42]\t$readingFrame[0][43]\t$readingFrame[0][44]\t$readingFrame[0][45]\t$readingFrame[0][46]\t$readingFrame[0][47]\t$readingFrame[0][48]\t$readingFrame[0][49]\t$readingFrame[0][50]\t$readingFrame[0][51]\t$readingFrame[0][52]\t$readingFrame[0][53]\t$readingFrame[0][54]\t$readingFrame[0][55]\t$readingFrame[0][56]\t$readingFrame[0][57]\t$readingFrame[0][58]\t$readingFrame[0][59]\t$readingFrame[0][60]\t$readingFrame[0][61]\t$readingFrame[0][62]\t$readingFrame[0][63]". "\t$readingFrame[1][0]\t$readingFrame[1][1]\t$readingFrame[1][2]\t$readingFrame[1][3]\t$readingFrame[1][4]\t$readingFrame[1][5]\t$readingFrame[1][6]\t$readingFrame[1][7]\t$readingFrame[1][8]\t$readingFrame[1][9]\t$readingFrame[1][10]\t$readingFrame[1][11]\t$readingFrame[1][12]\t$readingFrame[1][13]\t$readingFrame[1][14]\t$readingFrame[1][15]\t$readingFrame[1][16]\t$readingFrame[1][17]\t$readingFrame[1][18]\t$readingFrame[1][19]\t$readingFrame[1][20]\t$readingFrame[1][21]\t$readingFrame[1][22]\t$readingFrame[1][23]\t$readingFrame[1][24]\t$readingFrame[1][25]\t$readingFrame[1][26]\t$readingFrame[1][27]\t$readingFrame[1][28]\t$readingFrame[1][29]\t$readingFrame[1][30]\t$readingFrame[1][31]\t$readingFrame[1][32]\t$readingFrame[1][33]\t$readingFrame[1][34]\t$readingFrame[1][35]\t$readingFrame[1][36]\t$readingFrame[1][37]\t$readingFrame[1][38]\t$readingFrame[1][39]\t$readingFrame[1][40]\t$readingFrame[1][41]\t$readingFrame[1][42]\t$readingFrame[1][43]\t$readingFrame[1][44]\t$readingFrame[1][45]\t$readingFrame[1][46]\t$readingFrame[1][47]\t$readingFrame[1][48]\t$readingFrame[1][49]\t$readingFrame[1][50]\t$readingFrame[1][51]\t$readingFrame[1][52]\t$readingFrame[1][53]\t$readingFrame[1][54]\t$readingFrame[1][55]\t$readingFrame[1][56]\t$readingFrame[1][57]\t$readingFrame[1][58]\t$readingFrame[1][59]\t$readingFrame[1][60]\t$readingFrame[1][61]\t$readingFrame[1][62]\t$readingFrame[1][63]" ."\t$readingFrame[2][0]\t$readingFrame[2][1]\t$readingFrame[2][2]\t$readingFrame[2][3]\t$readingFrame[2][4]\t$readingFrame[2][5]\t$readingFrame[2][6]\t$readingFrame[2][7]\t$readingFrame[2][8]\t$readingFrame[2][9]\t$readingFrame[2][10]\t$readingFrame[2][11]\t$readingFrame[2][12]\t$readingFrame[2][13]\t$readingFrame[2][14]\t$readingFrame[2][15]\t$readingFrame[2][16]\t$readingFrame[2][17]\t$readingFrame[2][18]\t$readingFrame[2][19]\t$readingFrame[2][20]\t$readingFrame[2][21]\t$readingFrame[2][22]\t$readingFrame[2][23]\t$readingFrame[2][24]\t$readingFrame[2][25]\t$readingFrame[2][26]\t$readingFrame[2][27]\t$readingFrame[2][28]\t$readingFrame[2][29]\t$readingFrame[2][30]\t$readingFrame[2][31]\t$readingFrame[2][32]\t$readingFrame[2][33]\t$readingFrame[2][34]\t$readingFrame[2][35]\t$readingFrame[2][36]\t$readingFrame[2][37]\t$readingFrame[2][38]\t$readingFrame[2][39]\t$readingFrame[2][40]\t$readingFrame[2][41]\t$readingFrame[2][42]\t$readingFrame[2][43]\t$readingFrame[2][44]\t$readingFrame[2][45]\t$readingFrame[2][46]\t$readingFrame[2][47]\t$readingFrame[2][48]\t$readingFrame[2][49]\t$readingFrame[2][50]\t$readingFrame[2][51]\t$readingFrame[2][52]\t$readingFrame[2][53]\t$readingFrame[2][54]\t$readingFrame[2][55]\t$readingFrame[2][56]\t$readingFrame[2][57]\t$readingFrame[2][58]\t$readingFrame[2][59]\t$readingFrame[2][60]\t$readingFrame[2][61]\t$readingFrame[2][62]\t$readingFrame[2][63]\n";
#check only one stop codon per gene
# reading frame 1 column 48 = TAA; 50= TAG; 56 = TGA.
            my $firstReadingFrameSum = $readingFrame[0][48] + $readingFrame[0][50] + $readingFrame[0][56];
            if ($firstReadingFrameSum eq 1)
            {
                print WriteFileGene "$geneName[$n]\n$newData[$n]\n";
                print WriteFileCSSRGene

"$geneName[$n]\t$readingFrame[0][0]\t$readingFrame[0][1]\t$readingFrame[0][2]\t$readingFrame[0][3]\t$readingFrame[0][4]\t$readingFrame[0][5]\t$readingFrame[0][6]\t$readingFrame[0][7]\t$readingFrame[0][8]\t$readingFrame[0][9]\t$readingFrame[0][10]\t$readingFrame[0][11]\t$readingFrame[0][12]\t$readingFrame[0][13]\t$readingFrame[0][14]\t$readingFrame[0][15]\t$readingFrame[0][16]\t$readingFrame[0][17]\t$readingFrame[0][18]\t$readingFrame[0][19]\t$readingFrame[0][20]\t$readingFrame[0][21]\t$readingFrame[0][22]\t$readingFrame[0][23]\t$readingFrame[0][24]\t$readingFrame[0][25]\t$readingFrame[0][26]\t$readingFrame[0][27]\t$readingFrame[0][28]\t$readingFrame[0][29]\t$readingFrame[0][30]\t$readingFrame[0][31]\t$readingFrame[0][32]\t$readingFrame[0][33]\t$readingFrame[0][34]\t$readingFrame[0][35]\t$readingFrame[0][36]\t$readingFrame[0][37]\t$readingFrame[0][38]\t$readingFrame[0][39]\t$readingFrame[0][40]\t$readingFrame[0][41]\t$readingFrame[0][42]\t$readingFrame[0][43]\t$readingFrame[0][44]\t$readingFrame[0][45]\t$readingFrame[0][46]\t$readingFrame[0][47]\t$readingFrame[0][48]\t$readingFrame[0][49]\t$readingFrame[0][50]\t$readingFrame[0][51]\t$readingFrame[0][52]\t$readingFrame[0][53]\t$readingFrame[0][54]\t$readingFrame[0][55]\t$readingFrame[0][56]\t$readingFrame[0][57]\t$readingFrame[0][58]\t$readingFrame[0][59]\t$readingFrame[0][60]\t$readingFrame[0][61]\t$readingFrame[0][62]\t$readingFrame[0][63]". "\t$readingFrame[1][0]\t$readingFrame[1][1]\t$readingFrame[1][2]\t$readingFrame[1][3]\t$readingFrame[1][4]\t$readingFrame[1][5]\t$readingFrame[1][6]\t$readingFrame[1][7]\t$readingFrame[1][8]\t$readingFrame[1][9]\t$readingFrame[1][10]\t$readingFrame[1][11]\t$readingFrame[1][12]\t$readingFrame[1][13]\t$readingFrame[1][14]\t$readingFrame[1][15]\t$readingFrame[1][16]\t$readingFrame[1][17]\t$readingFrame[1][18]\t$readingFrame[1][19]\t$readingFrame[1][20]\t$readingFrame[1][21]\t$readingFrame[1][22]\t$readingFrame[1][23]\t$readingFrame[1][24]\t$readingFrame[1][25]\t$readingFrame[1][26]\t$readingFrame[1][27]\t$readingFrame[1][28]\t$readingFrame[1][29]\t$readingFrame[1][30]\t$readingFrame[1][31]\t$readingFrame[1][32]\t$readingFrame[1][33]\t$readingFrame[1][34]\t$readingFrame[1][35]\t$readingFrame[1][36]\t$readingFrame[1][37]\t$readingFrame[1][38]\t$readingFrame[1][39]\t$readingFrame[1][40]\t$readingFrame[1][41]\t$readingFrame[1][42]\t$readingFrame[1][43]\t$readingFrame[1][44]\t$readingFrame[1][45]\t$readingFrame[1][46]\t$readingFrame[1][47]\t$readingFrame[1][48]\t$readingFrame[1][49]\t$readingFrame[1][50]\t$readingFrame[1][51]\t$readingFrame[1][52]\t$readingFrame[1][53]\t$readingFrame[1][54]\t$readingFrame[1][55]\t$readingFrame[1][56]\t$readingFrame[1][57]\t$readingFrame[1][58]\t$readingFrame[1][59]\t$readingFrame[1][60]\t$readingFrame[1][61]\t$readingFrame[1][62]\t$readingFrame[1][63]" ."\t$readingFrame[2][0]\t$readingFrame[2][1]\t$readingFrame[2][2]\t$readingFrame[2][3]\t$readingFrame[2][4]\t$readingFrame[2][5]\t$readingFrame[2][6]\t$readingFrame[2][7]\t$readingFrame[2][8]\t$readingFrame[2][9]\t$readingFrame[2][10]\t$readingFrame[2][11]\t$readingFrame[2][12]\t$readingFrame[2][13]\t$readingFrame[2][14]\t$readingFrame[2][15]\t$readingFrame[2][16]\t$readingFrame[2][17]\t$readingFrame[2][18]\t$readingFrame[2][19]\t$readingFrame[2][20]\t$readingFrame[2][21]\t$readingFrame[2][22]\t$readingFrame[2][23]\t$readingFrame[2][24]\t$readingFrame[2][25]\t$readingFrame[2][26]\t$readingFrame[2][27]\t$readingFrame[2][28]\t$readingFrame[2][29]\t$readingFrame[2][30]\t$readingFrame[2][31]\t$readingFrame[2][32]\t$readingFrame[2][33]\t$readingFrame[2][34]\t$readingFrame[2][35]\t$readingFrame[2][36]\t$readingFrame[2][37]\t$readingFrame[2][38]\t$readingFrame[2][39]\t$readingFrame[2][40]\t$readingFrame[2][41]\t$readingFrame[2][42]\t$readingFrame[2][43]\t$readingFrame[2][44]\t$readingFrame[2][45]\t$readingFrame[2][46]\t$readingFrame[2][47]\t$readingFrame[2][48]\t$readingFrame[2][49]\t$readingFrame[2][50]\t$readingFrame[2][51]\t$readingFrame[2][52]\t$readingFrame[2][53]\t$readingFrame[2][54]\t$readingFrame[2][55]\t$readingFrame[2][56]\t$readingFrame[2][57]\t$readingFrame[2][58]\t$readingFrame[2][59]\t$readingFrame[2][60]\t$readingFrame[2][61]\t$readingFrame[2][62]\t$readingFrame[2][63]\n";

            }
            else
            {
                print WriteFileNonGene
"$geneName[$n]\t$readingFrame[0][0]\t$readingFrame[0][1]\t$readingFrame[0][2]\t$readingFrame[0][3]\t$readingFrame[0][4]\t$readingFrame[0][5]\t$readingFrame[0][6]\t$readingFrame[0][7]\t$readingFrame[0][8]\t$readingFrame[0][9]\t$readingFrame[0][10]\t$readingFrame[0][11]\t$readingFrame[0][12]\t$readingFrame[0][13]\t$readingFrame[0][14]\t$readingFrame[0][15]\t$readingFrame[0][16]\t$readingFrame[0][17]\t$readingFrame[0][18]\t$readingFrame[0][19]\t$readingFrame[0][20]\t$readingFrame[0][21]\t$readingFrame[0][22]\t$readingFrame[0][23]\t$readingFrame[0][24]\t$readingFrame[0][25]\t$readingFrame[0][26]\t$readingFrame[0][27]\t$readingFrame[0][28]\t$readingFrame[0][29]\t$readingFrame[0][30]\t$readingFrame[0][31]\t$readingFrame[0][32]\t$readingFrame[0][33]\t$readingFrame[0][34]\t$readingFrame[0][35]\t$readingFrame[0][36]\t$readingFrame[0][37]\t$readingFrame[0][38]\t$readingFrame[0][39]\t$readingFrame[0][40]\t$readingFrame[0][41]\t$readingFrame[0][42]\t$readingFrame[0][43]\t$readingFrame[0][44]\t$readingFrame[0][45]\t$readingFrame[0][46]\t$readingFrame[0][47]\t$readingFrame[0][48]\t$readingFrame[0][49]\t$readingFrame[0][50]\t$readingFrame[0][51]\t$readingFrame[0][52]\t$readingFrame[0][53]\t$readingFrame[0][54]\t$readingFrame[0][55]\t$readingFrame[0][56]\t$readingFrame[0][57]\t$readingFrame[0][58]\t$readingFrame[0][59]\t$readingFrame[0][60]\t$readingFrame[0][61]\t$readingFrame[0][62]\t$readingFrame[0][63]". "\t$readingFrame[1][0]\t$readingFrame[1][1]\t$readingFrame[1][2]\t$readingFrame[1][3]\t$readingFrame[1][4]\t$readingFrame[1][5]\t$readingFrame[1][6]\t$readingFrame[1][7]\t$readingFrame[1][8]\t$readingFrame[1][9]\t$readingFrame[1][10]\t$readingFrame[1][11]\t$readingFrame[1][12]\t$readingFrame[1][13]\t$readingFrame[1][14]\t$readingFrame[1][15]\t$readingFrame[1][16]\t$readingFrame[1][17]\t$readingFrame[1][18]\t$readingFrame[1][19]\t$readingFrame[1][20]\t$readingFrame[1][21]\t$readingFrame[1][22]\t$readingFrame[1][23]\t$readingFrame[1][24]\t$readingFrame[1][25]\t$readingFrame[1][26]\t$readingFrame[1][27]\t$readingFrame[1][28]\t$readingFrame[1][29]\t$readingFrame[1][30]\t$readingFrame[1][31]\t$readingFrame[1][32]\t$readingFrame[1][33]\t$readingFrame[1][34]\t$readingFrame[1][35]\t$readingFrame[1][36]\t$readingFrame[1][37]\t$readingFrame[1][38]\t$readingFrame[1][39]\t$readingFrame[1][40]\t$readingFrame[1][41]\t$readingFrame[1][42]\t$readingFrame[1][43]\t$readingFrame[1][44]\t$readingFrame[1][45]\t$readingFrame[1][46]\t$readingFrame[1][47]\t$readingFrame[1][48]\t$readingFrame[1][49]\t$readingFrame[1][50]\t$readingFrame[1][51]\t$readingFrame[1][52]\t$readingFrame[1][53]\t$readingFrame[1][54]\t$readingFrame[1][55]\t$readingFrame[1][56]\t$readingFrame[1][57]\t$readingFrame[1][58]\t$readingFrame[1][59]\t$readingFrame[1][60]\t$readingFrame[1][61]\t$readingFrame[1][62]\t$readingFrame[1][63]" ."\t$readingFrame[2][0]\t$readingFrame[2][1]\t$readingFrame[2][2]\t$readingFrame[2][3]\t$readingFrame[2][4]\t$readingFrame[2][5]\t$readingFrame[2][6]\t$readingFrame[2][7]\t$readingFrame[2][8]\t$readingFrame[2][9]\t$readingFrame[2][10]\t$readingFrame[2][11]\t$readingFrame[2][12]\t$readingFrame[2][13]\t$readingFrame[2][14]\t$readingFrame[2][15]\t$readingFrame[2][16]\t$readingFrame[2][17]\t$readingFrame[2][18]\t$readingFrame[2][19]\t$readingFrame[2][20]\t$readingFrame[2][21]\t$readingFrame[2][22]\t$readingFrame[2][23]\t$readingFrame[2][24]\t$readingFrame[2][25]\t$readingFrame[2][26]\t$readingFrame[2][27]\t$readingFrame[2][28]\t$readingFrame[2][29]\t$readingFrame[2][30]\t$readingFrame[2][31]\t$readingFrame[2][32]\t$readingFrame[2][33]\t$readingFrame[2][34]\t$readingFrame[2][35]\t$readingFrame[2][36]\t$readingFrame[2][37]\t$readingFrame[2][38]\t$readingFrame[2][39]\t$readingFrame[2][40]\t$readingFrame[2][41]\t$readingFrame[2][42]\t$readingFrame[2][43]\t$readingFrame[2][44]\t$readingFrame[2][45]\t$readingFrame[2][46]\t$readingFrame[2][47]\t$readingFrame[2][48]\t$readingFrame[2][49]\t$readingFrame[2][50]\t$readingFrame[2][51]\t$readingFrame[2][52]\t$readingFrame[2][53]\t$readingFrame[2][54]\t$readingFrame[2][55]\t$readingFrame[2][56]\t$readingFrame[2][57]\t$readingFrame[2][58]\t$readingFrame[2][59]\t$readingFrame[2][60]\t$readingFrame[2][61]\t$readingFrame[2][62]\t$readingFrame[2][63]\n";

            }
        }

        close(WriteFile);
        close(WriteFileGene);
        close(WriteFileTSSRGene);
        close(WriteFileNonGene);
        close(WriteFileTSSRGene);
    }
}
print "job done\n";
exit;

sub checkCodon()
{

my($myCodon,$readingFrameRow)=@_;
if($myCodon eq'AAA')
{
$readingFrame[$readingFrameRow][0]=$readingFrame[$readingFrameRow][0]+1;
}
if($myCodon eq'AAC')
{
$readingFrame[$readingFrameRow][1]++;
}
if($myCodon eq'AAG')
{
$readingFrame[$readingFrameRow][2]++;
}
if($myCodon eq'AAT')
{
$readingFrame[$readingFrameRow][3]++;
}
if($myCodon eq'ACA')
{
$readingFrame[$readingFrameRow][4]++;
}
if($myCodon eq'ACC')
{
$readingFrame[$readingFrameRow][5]++;
}
if($myCodon eq'ACG')
{
$readingFrame[$readingFrameRow][6]++;
}
if($myCodon eq'ACT')
{
$readingFrame[$readingFrameRow][7]++;
}
if($myCodon eq'AGA')
{
$readingFrame[$readingFrameRow][8]++;
}
if($myCodon eq'AGC')
{
$readingFrame[$readingFrameRow][9]++;
}
if($myCodon eq'AGG')
{
$readingFrame[$readingFrameRow][10]++;
}
if($myCodon eq'AGT')
{
$readingFrame[$readingFrameRow][11]++;
}
if($myCodon eq'ATA')
{
$readingFrame[$readingFrameRow][12]++;
}
if($myCodon eq'ATC')
{
$readingFrame[$readingFrameRow][13]++;
}
if($myCodon eq'ATG')
{
$readingFrame[$readingFrameRow][14]++;
}
if($myCodon eq'ATT')
{
$readingFrame[$readingFrameRow][15]++;
}
if($myCodon eq'CAA')
{
$readingFrame[$readingFrameRow][16]++;
}
if($myCodon eq'CAC')
{
$readingFrame[$readingFrameRow][17]++;
}
if($myCodon eq'CAG')
{
$readingFrame[$readingFrameRow][18]++;
}
if($myCodon eq'CAT')
{
$readingFrame[$readingFrameRow][19]++;
}
if($myCodon eq'CCA')
{
$readingFrame[$readingFrameRow][20]++;
}
if($myCodon eq'CCC')
{
$readingFrame[$readingFrameRow][21]++;
}
if($myCodon eq'CCG')
{
$readingFrame[$readingFrameRow][22]++;
}
if($myCodon eq'CCT')
{
$readingFrame[$readingFrameRow][23]++;
}
if($myCodon eq'CGA')
{
$readingFrame[$readingFrameRow][24]++;
}
if($myCodon eq'CGC')
{
$readingFrame[$readingFrameRow][25]++;
}
if($myCodon eq'CGG')
{
$readingFrame[$readingFrameRow][26]++;
}
if($myCodon eq'CGT')
{
$readingFrame[$readingFrameRow][27]++;
}
if($myCodon eq'CTA')
{
$readingFrame[$readingFrameRow][28]++;
}
if($myCodon eq'CTC')
{
$readingFrame[$readingFrameRow][29]++;
}
if($myCodon eq'CTG')
{
$readingFrame[$readingFrameRow][30]++;
}
if($myCodon eq'CTT')
{
$readingFrame[$readingFrameRow][31]++;
}
if($myCodon eq'GAA')
{
$readingFrame[$readingFrameRow][32]++;
}
if($myCodon eq'GAC')
{
$readingFrame[$readingFrameRow][33]++;
}
if($myCodon eq'GAG')
{
$readingFrame[$readingFrameRow][34]++;
}
if($myCodon eq'GAT')
{
$readingFrame[$readingFrameRow][35]++;
}
if($myCodon eq'GCA')
{
$readingFrame[$readingFrameRow][36]++;
}
if($myCodon eq'GCC')
{
$readingFrame[$readingFrameRow][37]++;
}
if($myCodon eq'GCG')
{
$readingFrame[$readingFrameRow][38]++;
}
if($myCodon eq'GCT')
{
$readingFrame[$readingFrameRow][39]++;
}
if($myCodon eq'GGA')
{
$readingFrame[$readingFrameRow][40]++;
}
if($myCodon eq'GGC')
{
$readingFrame[$readingFrameRow][41]++;
}
if($myCodon eq'GGG')
{
$readingFrame[$readingFrameRow][42]++;
}
if($myCodon eq'GGT')
{
$readingFrame[$readingFrameRow][43]++;
}
if($myCodon eq'GTA')
{
$readingFrame[$readingFrameRow][44]++;
}
if($myCodon eq'GTC')
{
$readingFrame[$readingFrameRow][45]++;
}
if($myCodon eq'GTG')
{
$readingFrame[$readingFrameRow][46]++;
}
if($myCodon eq'GTT')
{
$readingFrame[$readingFrameRow][47]++;
}
if($myCodon eq'TAA')
{
$readingFrame[$readingFrameRow][48]++;
}
if($myCodon eq'TAC')
{
$readingFrame[$readingFrameRow][49]++;
}
if($myCodon eq'TAG')
{
$readingFrame[$readingFrameRow][50]++;
}
if($myCodon eq'TAT')
{
$readingFrame[$readingFrameRow][51]++;
}
if($myCodon eq'TCA')
{
$readingFrame[$readingFrameRow][52]++;
}
if($myCodon eq'TCC')
{
$readingFrame[$readingFrameRow][53]++;
}
if($myCodon eq'TCG')
{
$readingFrame[$readingFrameRow][54]++;
}
if($myCodon eq'TCT')
{
$readingFrame[$readingFrameRow][55]++;
}
if($myCodon eq'TGA')
{
$readingFrame[$readingFrameRow][56]++;
}
if($myCodon eq'TGC')
{
$readingFrame[$readingFrameRow][57]++;
}
if($myCodon eq'TGG')
{
$readingFrame[$readingFrameRow][58]++;
}
if($myCodon eq'TGT')
{
$readingFrame[$readingFrameRow][59]++;
}
if($myCodon eq'TTA')
{
$readingFrame[$readingFrameRow][60]++;
}
if($myCodon eq'TTC')
{
$readingFrame[$readingFrameRow][61]++;
}
if($myCodon eq'TTG')
{
$readingFrame[$readingFrameRow][62]++;
}
if($myCodon eq'TTT')
{
$readingFrame[$readingFrameRow][63]++;
}


}


sub randomAssign()
{
    my ($chUcase) = @_;
    #print $chUcase . "\t";
    my @primary_codon_letters = ('C', 'A', 'G', 'T');

    if( $chUcase eq 'A' || $chUcase eq 'C' ||
		$chUcase eq 'G' || $chUcase eq 'T' )
    {
        return $chUcase;
    }

   my $g = rand() % 2;
	 if( $chUcase eq 'M' )
	 {
		  if( $g eq 0 )
      {
          return 'A';
      }
		  if( $g eq 1 )
      {
          return 'C';
      }
	 }
	  if( $chUcase eq 'N' )
	 {
		  if( $g eq 0 )
      {
          return 'A';
      }
		  if( $g eq 1 )
      {
          return 'C';
      }
	 }
   if( $chUcase eq 'R' )
	 {
		  if( $g eq 0 )
      {
          return 'A';
      }
		  if( $g eq 1 )
      {
          return 'G';
      }
	 }
   if( $chUcase eq 'W' )
	 {
		  if( $g eq 0 )
      {
          return 'A';
      }
		  if( $g eq 1 )
      {
          return 'T';
      }
	 }
   if( $chUcase eq 'S' )
	 {
		  if( $g eq 0 )
      {
          return 'C';
      }
		  if( $g eq 1 )
      {
          return 'G';
      }
	 }
   if( $chUcase eq 'K' )
	 {
		  if( $g eq 0 )
      {
          return 'C';
      }
		  if( $g eq 1 )
      {
          return 'T';
      }
	 }
   if( $chUcase eq 'K' )
	 {
		  if( $g eq 0 )
      {
          return 'G';
      }
		  if( $g eq 1 )
      {
          return 'T';
      }
	 }

   $i = rand() % 3;
	 if( $chUcase eq 'V' )
	 {
		  if( $g eq 0 )
      {
          return 'A';
      }
		  if( $g eq 1 )
      {
          return 'C';
      }
		  return 'G';
	 }

	 if( $chUcase eq 'H' )
	 {
		  if($g eq 0 )
      {
          return 'A';
      }
		  if($g eq 1 )
      {
          return 'C';
      }
		  return 'T';
	 }

	 if( $chUcase eq 'D' )
	 {
		  if( $g eq 0 )
      {
          return 'A';
      }
		  if( $g eq 1 )
      {
          return 'G';
      }
		  return 'T';
	 }

	 if( $chUcase eq 'B' )
	 {
		  if( $g eq 0 )
      {
          return 'C';
      }
		  if( $g eq 1 )
      {
          return 'G';
      }
		  return 'T';
	 }
   if( $chUcase eq 'N' )
   {
		  $g = rand() % 4;
		  return $primary_codon_letters[$i];
	 }

   #print("unknown ch_ucase $chUcase\n");

   return 'X';
}

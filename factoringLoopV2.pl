#!/usr/bin/perl
#  !C:\\Perl64\\bin\\perl -w
#
#FileName:  factoringLoopV2.pl
#Description:  This program will print the prime factors of all numbers le to $ARV[0].
#
#<Note DNLewis 20160614>
# These are the lines that started me down this path:
#   $i=1; while ($i>0) {$value=$i**(0.5); print $value."\n"; $i++;};
#   $y=shift;for($i=2;$i<=$y;){next if$y%$i++;$y/=--$i;push@x,$i}print@{$,=x};
#</Note DNLewis 20160614> 

use strict;
use warnings;
#use Win32::Console::ANSI;
use Term::ANSIColor;

my $start = time;
my ($fctrLimit, $otherJunk) = @ARGV;
if (not defined $fctrLimit) {
	$fctrLimit=10;
}

our @primes = (1, 2, 3, 5, 7, 11, 13);

sub fctr {
	my $debug = 0; 
	my $i=1;
	my $fctrs=1;
	my @x=();
	my $y=shift(@_);
	#my $maxPrime=$y/2;
	my $maxPrime=sqrt($y);
  print "y is: ".$y." xxx\n" if $debug;
  print "the prime is: ".$primes[$i]." yyy\n" if $debug;
  while (($primes[$i] <= $maxPrime) && ($primes[$i] != $y))  {
  print "\nmaxPrime: " . $maxPrime . "\n" if $debug;
  print "boolian1: " . ($primes[$i] <= $maxPrime) . "\n" if $debug;
  print "p1 ".$primes[$i]."y:".$y."\n" if $debug;
   	next if $y%($primes[$i++]);   
    $y/=$primes[--$i]; 
    print "\n p2 ".$primes[$i]."y:".$y."\n" if $debug;
    push @x, $primes[$i];
    $fctrs++;
  }
print "p3 ".$primes[$i]."y:".$y."\n" if $debug;  
if ($primes[$i] ge $maxPrime || $primes[$i] eq $y) {
  	push @x,$y;
  } 
if ($y > 13 && $fctrs == 1) {
	push @primes, $y;
	} 

if ($fctrs == 1) {
  print color("green");
}
else {
  print color("magenta");
}
print @x;
print color("reset");
print " (".$fctrs.")\n";
}

MAIN:
my $line=2;
$,="x";								# Modifying output record delimiter "$,"

while ($line<$fctrLimit) {
	@_[0] = $line;
	print $line."=";
	fctr(@_);
#	print "\n";
	$line++;
}
print join( ',',@primes );	print "\n";
my $duration = time - $start;
print "Execution time: $duration s\n";

#!C:\\Perl64\\bin\\perl -w
#
#FileName:  factoringLoop.pl
#Description:  This program will print the prime factors of all numbers le to $ARV[0].
#
#<Note DNLewis 20160614>
# These are the lines that started me down this path:
#   $i=1; while ($i>0) {$value=$i**(0.5); print $value."\n"; $i++;};
#   $y=shift;for($i=2;$i<=$y;){next if$y%$i++;$y/=--$i;push@x,$i}print@{$,=x};
#</Note DNLewis 20160614> 

use warnings;
use Win32::Console::ANSI;
use Term::ANSIColor;

my $start = time;
my ($fctrLimit, $otherJunk) = @ARGV;
if (not defined $fctrLimit) {
	$fctrLimit=10;
}

sub fctr {
	$fctrs=1;
	@x=();
	$y=shift(@_);
  for($i=2;$i<=$y/2;){
    next if $y%$i++;   #NOTE: It divides by the current value of $i THEN increments it.
    $y/=--$i;   #NOTE: It FIRST decrements $i then uses that value to divide (and create the new) $y.
    push@x,$i;
    $fctrs++;
  }
  if ($i=$y/2) {
  	push @x,$y;
  }
#print @{$,=x}; # ." (".$fctrs.")";
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
#$primes[0] = 2;
$line=2;
$,="x";								# Modifying output record delimiter "$,"

while ($line<$fctrLimit) {
	@_[0] = $line;
	print $line."=";
	fctr(@_);
#	print "\n";
	$line++;
}
my $duration = time - $start;
print "Execution time: $duration s\n";s



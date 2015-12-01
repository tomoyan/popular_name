# Read a file of names
# And then display 5 popular last names

use strict;
use warnings;
use Data::Dumper;

print "### Sart ###\n";

open (MYFILE, 'name_list.txt');

my @last_names;

while (<MYFILE>) {
	chomp;
	my $last_name = (split(/ /, $_))[1];
	push @last_names, $last_name;
}

close (MYFILE);

my %hash;
foreach my $name(@last_names){
	$hash{$name}++;
}

my $i = 0;
foreach my $key (sort {$hash{$b} <=> $hash{$a}} keys %hash) {
	if($i < 5){
		print "$key: $hash{$key}\n";
		$i++;
	}
	else { last; }
}

print "### End ###\n";
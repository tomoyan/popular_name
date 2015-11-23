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

	if(grep { $_->{last_name} eq $last_name } @last_names){
		foreach my $data (@last_names){
			if($data->{last_name} eq $last_name){
				$data->{count}++;
			}
		}
	}
	else{
		push @last_names, {
			last_name => $last_name,
			count     => 1,
		}
	}
}

close (MYFILE);

@last_names = sort {$b->{count} <=> $a->{count}} @last_names;

for(my $i = 0; $i < 5; $i++){
	print "$last_names[$i]->{last_name}: $last_names[$i]->{count}\n";
}

print "### End ###\n";

#!/usr/bin/perl -w

use strict;
use warnings;

BEGIN {	use lib ( "/opt/@{[ ( getpwuid($<) )[0] ]}/includes", '/opt/DTI/modules', '/opt/includes' ); }

use Data::Dumper;

#####################################################
my ($volume, $directory) = File::Spec->splitpath(__FILE__);
my $file = "$directory/data.json";
open my $fh, '<', $file or die "Could not open '$file' $!\n";
my $json_text = "";
while (my $line = <$fh>) {
	$json_text .= $line;
}
my $json = JSON->new;
my $response = $json->decode($json_text);

print Dumper($response);
#####################################################
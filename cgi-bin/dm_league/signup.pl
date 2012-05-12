#!/usr/bin/perl

use warnings;
use CGI qw/:standard/;
use strict;
use DBI;

my $my_cnf = '/secret/my_cnf.cnf';

my $dbh = DBI->connect("DBI:mysql:"
    . ";mysql_read_default_file=$my_cnf"
    .';mysql_read_default_group=dm_league',
    undef,
    undef
) or die "something went wrong ($DBI::errstr)";




my $q = new CGI;
print $q->header,$q->start_html;


if(param()){

	my $callsign=param('callsign');
	my $email=param('email');


	if(newuser($callsign,$email)){
	#add them to roster
	}else{

print <<HTML
<form action="signup.pl" method="POST">
<table border="0">
<tr><td>your callsign:</td><td><input type="text" name="callsign"></td></tr>
<tr><td>your email:</td><td><input type="text" name="email"></td></tr>
<tr><td></td><td><input type="submit"></td></tr>
</table>
</form>
HTML
;

	}
}

sub newuser{
	my($callsign,$email)=@_;
}


print "</html>";



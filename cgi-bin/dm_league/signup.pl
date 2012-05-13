#!/usr/bin/perl

use warnings;
use CGI qw/:standard/;
use strict;
use DBI;
use Email::Valid;
use HTML::Entities ();

my $my_cnf = '/secret/my_cnf.cnf';

my $dbh = DBI->connect("DBI:mysql:"
    . ";mysql_read_default_file=$my_cnf"
    .';mysql_read_default_group=dm_league',
    undef,
    undef
) or die "something went wrong ($DBI::errstr)";




my $q = new CGI;
print $q->header,$q->start_html;


print <<HTML
<form action="/cgi-bin/dm_league/signup.pl" method="POST" enctype="multipart/form-data">
<table border="0">
<tr><td>your callsign:</td><td><input type="text" name="callsign"></td></tr>
<tr><td>your email:</td><td><input type="text" name="email"></td></tr>
<tr><td>your password (not asgs):</td><td><input type="text" name="password"></td></tr>
<tr><td></td><td><button type="submit">Submit</button></td></tr>
</table>
</form>
HTML
;


my $ok_chars = 'a-zA-Z0-9 ,-';
foreach my $param_name ( param() ) {
    $_ = HTML::Entities::decode( param($param_name) );
    $_ =~ s/[^$ok_chars]//go;
    param($param_name,$_);
}


my $email=param('email');
my $callsign=param('callsign');
my $password=param('password');

if($password eq ''){
	print hr,"your password cannot be blank!";
	exit;
}

if(!Email::Valid->address($email)){
	print hr, "invalid email";
	exit;
}





print "</html>";



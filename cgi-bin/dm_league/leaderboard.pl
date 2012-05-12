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




print header,start_html;
print "welcome to dm_league",br;
print <<LINKS
<a href="signup.pl">sign up</a> | <a href="submitresults.pl">submit results</a>
<hr>
LINKS
;
print <<RECENT_DMS
list of recent dms here
<hr>
RECENT_DMS
;
print <<LEADERBOARD
DM leaderboard here
LEADERBOARD
;

print "</html>";



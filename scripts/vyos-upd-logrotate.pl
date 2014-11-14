#!/usr/bin/perl -w

my @bool_values = qw!missingok compress notifempty sharedscripts!;
my @single_values = qw!rotate!;

use lib '/opt/vyatta/share/perl5';
use Vyatta::Config;
$config = new Vyatta::Config;

my $name = $ARGV[0];

if( @ARGV != 1 ){
  print "Usage: $0 logname";
  exit 1;
}

unless( $config->exists("system logrotate $name" ) ){
  die "Can't find node";
}

$config->setLevel("system logrotate $name");

my @path = $config->returnValues("path");

print join(" ",@path);
print " {\n";

my $interval = $config->returnValue("interval");
print "  $interval\n" if defined($interval);

foreach my $i ( @single_values ){
  my $v = $config->returnValue("$i");
  print "  $i $v\n" if defined($v);
}

foreach my $i ( @bool_values ){
  my $v = $config->returnValue("$i");
  print "  $i\n" if defined($v);
}

print "}\n";


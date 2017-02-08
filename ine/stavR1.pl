#!/usr/bin/perl -w
#use strict;
use warnings;
my $filename = '/sys/class/gpio/gpio26/value';

print "Content-type: text/html\r\n\r\n";

print "Hello there!<br />\nJust testing .<br />\n";

print "<html>";
print "<head>";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1250\" />";
print "<meta http-equiv=\"Refresh\" content=\"0; url=/cgi-bin/jaroCGI\" />";
print "<!meta http-equiv=\"Refresh\" content=\"0; url=/cgi-bin/hbTest2\" />";
print "<title>N� dom</title>";
print "</head>";
print "<body>";
print "<h1><a href=\"/cgi-bin/jaroCGI\">V�taj doma. Presmerujem �a k riadeniu domu...</h1>";
print "</body>";

for ($i=0; $i<10; $i++)
{
print $i."<br />";
}

print $filename;
print "<br>";
print "------\n";
print "<br>";
 
if (open(my $fh, '<:encoding(UTF-8)', $filename)) {
  while (my $row = <$fh>) {
    chomp $row;
    print "$row\n";
    print "AAAAAAAA\n";
print "<br>";
  }
  print "BBBBBBBB\n";
print "<br>";
} else {
  warn "Could not open file '$filename' $!";
}

print "DDDDDDD\n";
print "<br>";
#system("echo 1 > /sys/class/gpio/gpio26/value");
$result = `gpio read 25`;
if ( $result == "1" )
{
  print "gpio 25: 1\n";
}
else
{
  print "gpio 25: 0\n";
}

print "<br>";

#system("sudo", "gpio", "write", "26", "1" );
system("gpio", "write", "25", "1" );
#system("gpio", "read", "25" );
if ( $? == -1 )
{
  print "command failed: $!\n";
}
else
{
  printf "command exited with value %d", $? >> 8;
}

print "</html>";

system("whoami > /tmp/jaro");
#sleep(3);




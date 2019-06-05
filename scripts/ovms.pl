#!/usr/bin/perl
# Respond to posts by ovms.html
# Uses perl CGI module: http://perldoc.perl.org/CGI.html

# don't do anything from the read-only server on port 8081
my $from = $ENV{"HTTP_REFERER"};
if ($from =~ /8081/) {
    print "Not available from Read-Only interface";
    exit 0;
}

# for some reason there is no PATH provided to scripts we run
$ENV{"PATH"} = "/bin:/usr/bin:/opt/local/LBTI_INDI/bin";

# get URL parameters
use CGI;
my $cgi = CGI->new();
my %params = $cgi->Vars();

# get channel name, number and Hz from URL 
my $cnumber = $params{cnumber};
my $cname = $params{cname};
my $hz = $params{hz};

# get this host's network IP (localhost not good enough)
my $host = `hostname -i`;
chomp ($host);

# get fresh accel data
my $fftcommand = "getOVMSchannel -c $cnumber -h $host | fft1d -t";
system ($fftcommand);

# prepare as png
my $plotcmd = "gnuplot -e 'OVMS_TITLE=\"OVMS $cname Channel $cnumber\"' -e 'OVMS_MAXHZ=$hz' ovms.gnp 2> /dev/null";
system ($plotcmd);

# send
system ("cat x.png");

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl HTML-ParseBrowser.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 33;
BEGIN { use_ok('HTML::ParseBrowser') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $browser = {};
while (<DATA>) {
    chomp;
    my ($uatag, $uastring) = split /: /, $_, 2;
    $browser->{$uatag} = $uastring;
}

ok($ua = new HTML::ParseBrowser, 'constructor');
ok($ua->Parse($browser->{Safari3_mac}), 'Parser');
ok($ua->name eq 'Safari', 'Recognise Safari 3');
ok($ua->major == 3, 'recognise Safari major version');
ok($ua->minor == 1, 'recognise Safari minor version');
ok($ua->lang eq 'en', "recognise Safari en-US as 'en'");
ok($ua->language eq 'English', "recognise Safari en-US as 'en'");

ok($ua->Parse($browser->{FF2_mac}) && $ua->name eq 'Firefox', 'recognise Firefox 2');
ok($ua->Parse($browser->{Camino_1}) && $ua->name eq 'Camino', 'recognise Camino 1');
ok($ua->Parse($browser->{FF3_win}) && $ua->name eq 'Firefox', 'recognise Firefox 3');
ok($ua->Parse($browser->{Safari3_win}) && $ua->name eq 'Safari' && $ua->major == 3 && $ua->minor, 'recognise Safari 3 for Windows');
ok($ua->Parse($browser->{IE7_vista}) && $ua->name eq 'Internet Explorer' && $ua->osvers eq 'Vista', 'recognise Internet Explorer 7');
ok($ua->Parse($browser->{Opera9_vista}) && $ua->name eq 'Opera', 'recognise Opera 9 when it\'s (rarely) not lying');
ok($ua->Parse($browser->{Lynx2_linux}) && $ua->name eq 'Lynx', 'recognise Lynx 2');
ok($ua->Parse($browser->{IE6_XP}) && $ua->name eq 'Internet Explorer', 'recognise Internet Explorer 6');
ok($ua->Parse($browser->{Konqueror_linux}) && $ua->name eq 'Konqueror', 'recognise Konqueror');
ok($ua->Parse($browser->{Epiphany_linux}) && $ua->name eq 'Epiphany', 'recognise Epiphany');
ok($ua->Parse($browser->{WebTV}) && $ua->name eq 'WebTV', 'recognise WebTV');
ok($ua->Parse($browser->{Chrome8_Win7}) && $ua->name eq 'Chrome' && $ua->osvers eq '7' && $ua->language eq 'German' && $ua->lang eq 'de', 'recognise Chrome 8 on Windows 7');
ok($ua->Parse($browser->{Firefox9_Win8}) && $ua->name eq 'Firefox' && $ua->osvers eq '8', 'recognise Firefox 9 on Windows 8');
ok($ua->Parse($browser->{Iceweasel_linux}) && $ua->name eq 'Iceweasel' && $ua->{version}->{major} == 3 && $ua->language eq 'French' && $ua->lang eq 'fr', 'recognise Iceweasel on Linux');
ok($ua->Parse($browser->{Iceweasel_Debian}) && $ua->name eq 'Iceweasel' && $ua->major == 3, 'recognise Iceweasel on Debian');
ok($ua->Parse($browser->{Opera_Russian}) && $ua->name eq 'Opera' && $ua->major == 7 && $ua->language eq 'Russian', 'recognise Opera 7.51 Russian');
ok($ua->Parse($browser->{IE10_Win7}) && $ua->name eq 'Internet Explorer' && $ua->major == 10, 'recognise IE 10');
ok($ua->Parse($browser->{IE9_Vista}) && $ua->name eq 'Internet Explorer' && $ua->major == 9, 'recognise IE 9');
ok($ua->Parse($browser->{IE8_Vista}) && $ua->name eq 'Internet Explorer' && $ua->major == 8, 'recognise IE 8');
ok($ua->Parse($browser->{Opera11_Mac}) && $ua->name eq 'Opera' && $ua->major == 11 && $ua->minor == 51, 'recognise Opera 11.51/Mac');
ok($ua->Parse($browser->{Netscape_Sunos}) && $ua->name eq 'Netscape' && $ua->major == 4 && $ua->minor == 79 && $ua->ostype eq 'Solaris' && $ua->osvers eq '5.10' && $ua->osarc eq 'i86pc', 'recognise Netscape on Solaris');
ok($ua->Parse($browser->{Firefox_Spanish}) && $ua->name eq 'Firefox' && $ua->major == 3 && $ua->minor == 6 && $ua->ostype eq 'Windows NT' && $ua->osvers eq '7' && $ua->language eq 'Spanish' && $ua->lang eq 'es', 'recognise Spanish Firefox 3.6.3');
ok($ua->Parse($browser->{OmniWeb_Italian}) && $ua->name eq 'OmniWeb' && $ua->major == 563 && $ua->minor == 15 && $ua->ostype eq 'Macintosh' && !defined($ua->osvers) && $ua->language eq 'Italian' && $ua->lang eq 'it', 'recognise Italian OmniWeb');
ok($ua->Parse($browser->{Opera_Danish}) && $ua->name eq 'Opera' && $ua->major == 9 && $ua->minor == 64 && $ua->ostype eq 'Linux' && !defined($ua->osarc) && $ua->language eq 'Danish' && $ua->lang eq 'da', 'recognise Danish Opera');
ok($ua->Parse($browser->{Safari_Japanese}) && $ua->name eq 'Safari' && $ua->major == 5 && $ua->minor == 0 && $ua->ostype eq 'Windows NT' && $ua->language eq 'Japanese' && $ua->lang eq 'ja', 'recognise Japanese Safari');

__DATA__
Safari3_mac: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_2; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18
FF2_mac: Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14
Camino_1: Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en; rv:1.8.1.14) Gecko/20080512 Camino/1.6.1 (like Firefox/2.0.0.14)
FF3_win: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9) Gecko/2008052906 Firefox/3.0
Safari3_win: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Version/3.1.2 Safari/525.21
IE7_vista: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506)
Opera9_vista: Opera/9.51 (Windows NT 6.0; U; en)
Lynx2_linux: Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 GNUTLS/1.0.16
IE6_XP: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648)
Konqueror_linux: Mozilla/5.0 (compatible; Konqueror/3.5; Linux) KHTML/3.5.5 (like Gecko) (Debian)
Epiphany_linux: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.14eol) Gecko/20070505 (Debian-1.8.0.15~pre080323b-0etch2) Epiphany/2.14
WebTV: Mozilla/4.0 WebTV/2.6 (compatible; MSIE 4.0)
Chrome8_Win7: Mozilla/5.0 (Windows; U; Windows NT 6.1; de-DE) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.224 Safari/534.10
Firefox9_Win8: Mozilla/5.0 (Windows NT 6.2; rv:9.0.1) Gecko/20100101 Firefox/9.0.1
Iceweasel_linux: Mozilla/5.0 (X11; U; Linux x86_64; fr; rv:1.9.2.13) Gecko/20101203 Iceweasel/3.6.7 (like Firefox/3.6.13)
Iceweasel_Debian: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.1) Gecko/20090730 Iceweasel/3.5.1 (Debian-3.5.1-1)
Opera_Russian: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 7.51 [ru]
IE10_Win7: Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)
IE9_Vista: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0; chromeframe/11.0.696.57)
IE8_Vista: Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 1.0.3705; .NET CLR 1.1.4322)
Opera11_Mac: Opera/9.80 (Macintosh; Intel Mac OS X 10.7.2; U; en) Presto/2.9.168 Version/11.51
Netscape_Sunos: Mozilla/4.79 [en] (X11; U; SunOS 5.10 i86pc)
Firefox_Spanish: Mozilla/5.0 (Windows; U; Windows NT 6.1; es-ES; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 GTB7.1
OmniWeb_Italian: Mozilla/5.0 (Macintosh; U; PPC Mac OS X; it-IT) AppleWebKit/125.4 (KHTML, like Gecko, Safari) OmniWeb/v563.15
Opera_Danish: Opera/9.64 (X11; Linux i686; U; da) Presto/2.1.1
Safari_Japanese: Mozilla/5.0 (Windows; U; Windows NT 6.0; ja-JP) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27

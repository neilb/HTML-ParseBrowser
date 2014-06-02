# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl HTML-ParseBrowser.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 49;
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
ok($ua->Parse($browser->{Konqueror_linux}) && $ua->name eq 'Konqueror' && $ua->os eq 'Linux', 'recognise Konqueror');
ok($ua->Parse($browser->{Epiphany_linux}) && $ua->name eq 'Epiphany', 'recognise Epiphany');
ok($ua->Parse($browser->{WebTV}) && $ua->name eq 'WebTV', 'recognise WebTV');
ok($ua->Parse($browser->{Chrome8_Win7}) && $ua->name eq 'Chrome' && $ua->osvers eq '7' && $ua->language eq 'German' && $ua->lang eq 'de', 'recognise Chrome 8 on Windows 7');
ok($ua->Parse($browser->{Firefox9_Win8}) && $ua->name eq 'Firefox' && $ua->osvers eq '8', 'recognise Firefox 9 on Windows 8');
ok($ua->Parse($browser->{Iceweasel_linux}) && $ua->name eq 'Iceweasel' && $ua->{version}->{major} == 3 && $ua->os eq 'Linux' && $ua->osarc eq 'x86_64' && $ua->language eq 'French' && $ua->lang eq 'fr', 'recognise Iceweasel on Linux');
ok($ua->Parse($browser->{Iceweasel_Debian}) && $ua->name eq 'Iceweasel' && $ua->major == 3 && $ua->os eq 'Linux' && $ua->osarc eq 'x86_64', 'recognise Iceweasel on Debian');
ok($ua->Parse($browser->{Opera_Russian}) && $ua->name eq 'Opera' && $ua->major == 7 && $ua->language eq 'Russian', 'recognise Opera 7.51 Russian');
ok($ua->Parse($browser->{IE10_Win7}) && $ua->name eq 'Internet Explorer' && $ua->major == 10, 'recognise IE 10');
ok($ua->Parse($browser->{IE9_Vista}) && $ua->name eq 'Internet Explorer' && $ua->major == 9, 'recognise IE 9');
ok($ua->Parse($browser->{IE8_Vista}) && $ua->name eq 'Internet Explorer' && $ua->major == 8, 'recognise IE 8');
ok($ua->Parse($browser->{Opera11_Mac}) && $ua->name eq 'Opera' && $ua->major == 11 && $ua->minor == 51, 'recognise Opera 11.51/Mac');
ok($ua->Parse($browser->{Netscape_Sunos}) && $ua->name eq 'Netscape' && $ua->major == 4 && $ua->minor == 79 && $ua->ostype eq 'Solaris' && $ua->osvers eq '5.10' && $ua->osarc eq 'i86pc', 'recognise Netscape on Solaris');
ok($ua->Parse($browser->{Firefox_Spanish}) && $ua->name eq 'Firefox' && $ua->major == 3 && $ua->minor == 6 && $ua->ostype eq 'Windows NT' && $ua->osvers eq '7' && $ua->language eq 'Spanish' && $ua->lang eq 'es', 'recognise Spanish Firefox 3.6.3');
ok($ua->Parse($browser->{OmniWeb_Italian}) && $ua->name eq 'OmniWeb' && $ua->major == 563 && $ua->minor == 15 && $ua->ostype eq 'Macintosh' && !defined($ua->osvers) && $ua->language eq 'Italian' && $ua->lang eq 'it', 'recognise Italian OmniWeb');
ok($ua->Parse($browser->{Opera_Danish}) && $ua->name eq 'Opera' && $ua->major == 9 && $ua->minor == 64 && $ua->os eq 'Linux' && $ua->ostype eq 'Linux' && $ua->osarc eq 'i686' && $ua->language eq 'Danish' && $ua->lang eq 'da', 'recognise Danish Opera');
ok($ua->Parse($browser->{Safari_Japanese}) && $ua->name eq 'Safari' && $ua->major == 5 && $ua->minor == 0 && $ua->ostype eq 'Windows NT' && $ua->language eq 'Japanese' && $ua->lang eq 'ja', 'recognise Japanese Safari');
ok($ua->Parse($browser->{Opera_Mini}) && $ua->name eq 'Opera Mini' && $ua->major == 6 && $ua->minor == 0 && $ua->language eq 'English' && $ua->lang eq 'en', 'recognise Opera Mini');
ok($ua->Parse($browser->{AOL_XP}) && $ua->name eq 'AOL' && $ua->major == 9 && $ua->minor == 6, 'recognise AOL on Win XP');
ok($ua->Parse($browser->{Iron_Win7}) && $ua->name eq 'Iron' && $ua->major == 13 && $ua->minor == 0 && $ua->v eq '13.0.800.1' && $ua->ostype eq 'Windows NT' && $ua->osvers eq '7', 'recognise AOL on Win XP');

ok($ua->Parse('Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25')
   && $ua->name eq 'Safari'
   && $ua->major == 6
   && $ua->minor == 0
   && $ua->v eq '6.0'
   && $ua->os eq 'iOS'
   && $ua->osvers eq '6.0',
   'Safari 6.0 on iOS 6.0');

ok($ua->Parse('Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25')
   && $ua->name eq 'Safari'
   && $ua->major == 6
   && $ua->minor == 0
   && $ua->v eq '6.0'
   && $ua->os eq 'iOS'
   && $ua->osvers eq '6.1.3',
   'Safari 6.0 on iPhone with iOS 6.1.3');

ok($ua->Parse('Mozilla/5.0 (iPad; CPU OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25')
   && $ua->name eq 'Safari'
   && $ua->major == 6
   && $ua->minor == 0
   && $ua->v eq '6.0'
   && $ua->os eq 'iOS'
   && $ua->osvers eq '6.1.3',
   'Safari 6.0 on iPad with iOS 6.1.3');

ok($ua->Parse('Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3')
   && $ua->name eq 'Safari'
   && $ua->major == 5
   && $ua->minor == 1
   && $ua->v eq '5.1'
   && $ua->os eq 'iOS'
   && $ua->osvers eq '5.0',
   'Safari 5.1 on iPhone with iOS 5.0');

ok($ua->Parse('Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7')
   && $ua->name eq 'Safari'
   && $ua->major == 4
   && $ua->minor == 0
   && $ua->v eq '4.0.5'
   && $ua->os eq 'iOS'
   && $ua->osvers eq '4.0',
   'Safari 4.0.5 on iPhone with iOS 4.0');

ok($ua->Parse('Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19')
   && $ua->name eq 'Chrome'
   && $ua->major == 18
   && $ua->minor == 0
   && $ua->v eq '18.0.1025.133'
   && $ua->os eq 'Android'
   && $ua->osvers eq '4.0.4'
   && $ua->ostype eq 'Linux',
   'Chrome 18 on Android 4.0.4');

ok($ua->Parse('Mozilla/5.0 (Linux; Android 4.2.1; Galaxy Nexus Build/JOP40D) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.58 Mobile Safari/537.31')
   && $ua->name eq 'Chrome'
   && $ua->major == 26
   && $ua->minor == 0
   && $ua->v eq '26.0.1410.58'
   && $ua->os eq 'Android'
   && $ua->osvers eq '4.2.1'
   && $ua->ostype eq 'Linux',
   'Chrome 26 on Android 4.2.1');

# Is this really Safari on Android?
ok($ua->Parse('Mozilla/5.0 (Linux; U; Android 3.2; en-us; GT-P7300 Build/HTJ85B) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13')
   && $ua->name eq 'Safari'
   && $ua->major == 4
   && $ua->minor == 0
   && $ua->v eq '4.0'
   && $ua->os eq 'Android'
   && $ua->osvers eq '3.2'
   && $ua->ostype eq 'Linux',
   'Safari 4.0 on Android 3.2');

ok($ua->Parse($browser->{IE11_Win8})
  && $ua->name eq 'Internet Explorer'
  && $ua->major == 11
  && $ua->minor == 0
  && $ua->v eq '11.0'
  && $ua->ostype eq 'Windows NT'
  && $ua->osvers eq '8.1',
  'IE8 on Windows 8.1');

ok($ua->Parse($browser->{Opera15_Win7})
  && $ua->name eq 'Opera'
  && $ua->major == 15
  && $ua->minor == 0
  && $ua->v eq '15.0.1147.100'
  && $ua->ostype eq 'Windows NT'
  && $ua->osvers eq '7',
  'Opera 15 on Windows 7');

ok($ua->Parse($browser->{BlackBerry10})
  && $ua->name eq 'BlackBerry'
  && $ua->major == 10
  && $ua->minor == 2
  && $ua->v eq '10.2.1.2141'
  && $ua->ostype eq 'BlackBerry'
  && $ua->os eq 'BlackBerry 10'
  && $ua->osvers eq '10'
  ,'BlackBerry 10');

ok($ua->Parse($browser->{BlackBerry7})
  && $ua->name eq 'BlackBerry'
  && $ua->major == 7
  && $ua->minor == 0
  && $ua->v eq '7.0.0.254'
  && $ua->os eq 'BlackBerry 7'
  && $ua->ostype eq 'BlackBerry'
  && $ua->osvers eq '7'
  ,'BlackBerry 7');

ok($ua->Parse($browser->{Chrome_criOS})
  && $ua->name eq 'Chrome'
  && $ua->major == 19
  && $ua->minor == 0
  && $ua->v eq '19.0.1084.60'
  && $ua->os eq 'iOS'
  && $ua->ostype eq 'iOS'
  && $ua->osvers eq '5.1.1'
  ,'Chrome on iOS 5.1.1');

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
Opera_Mini: Opera/9.80 (Series 60; Opera Mini/6.0.24095/24.760; U; en) Presto/2.5.25 Version/10.54
AOL_XP: Mozilla/4.0 (compatible; MSIE 8.0; AOL 9.6; AOLBuild 4340.5001; Windows NT 5.1; Trident/4.0)
Iron_Win7: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.1 (KHTML, like Gecko)  Iron/13.0.800.1 Chrome/13.0.800.1 Safari/535.1
IE11_Win8: Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko
Opera15_Win7: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.52 Safari/537.36 OPR/15.0.1147.100
BlackBerry10: Mozilla/5.0 (BB10; Touch) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.2.1.2141 Mobile Safari/537.35+
BlackBerry7: Mozilla/5.0 (BlackBerry; U; BlackBerry 9860; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.0.0.254 Mobile Safari/534.11+
Chrome_criOS: Mozilla/5.0 (iPhone; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) CriOS/19.0.1084.60 Mobile/9B206 Safari/7534.48.3

use 5.004;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'HTML::ParseBrowser',
    VERSION_FROM      => 'lib/HTML/ParseBrowser.pm',
    PREREQ_PM         => {
                          'Test::More' => 0,
                         },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/HTML/ParseBrowser.pm',
       AUTHOR         => 'Neil Bowers <neil@bowers.com>') : ()),
    ($ExtUtils::MakeMaker::VERSION ge '6.48'?
     (MIN_PERL_VERSION => 5.004,
      META_MERGE => {
        keywords  => ['user-agent','browser','browser detection'],
        resources => {
            repository => 'https://github.com/neilbowers/HTML-ParseBrowser',
        },
      },
      'LICENSE'     => 'perl',
     ) : ()),

);

use 5.004;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'HTML::ParseBrowser',
    VERSION_FROM      => 'lib/HTML/ParseBrowser.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/HTML/ParseBrowser.pm', # retrieve abstract from module
       AUTHOR         => 'Dodger <dodger@>') : ()),
    ($ExtUtils::MakeMaker::VERSION ge '6.48'?
     (MIN_PERL_VERSION => 5.004,
      META_MERGE => {
        keywords => ['user-agent','browser','browser detection'],
      },
      'LICENSE'     => 'perl',
     ) : ()),

);

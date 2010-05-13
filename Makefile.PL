
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::PluginBundle::ROKR',
                       'DISTNAME' => 'Dist-Zilla-PluginBundle-ROKR',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Robert Krimen <robertkrimen@gmail.com>',
                       'BUILD_REQUIRES' => {
                                             'Test::Most' => '0'
                                           },
                       'ABSTRACT' => 'A nifty little plugin bundle for Dist::Zilla',
                       'EXE_FILES' => [],
                       'VERSION' => '0.0011',
                       'PREREQ_PM' => {
                                        'File::Copy' => '0',
                                        'Dist::Zilla::Plugin::PodWeaver' => '0',
                                        'Config::Identity' => '0',
                                        'LWP::UserAgent' => '0',
                                        'Dist::Zilla::Plugin::PkgVersion' => '0',
                                        'Dist::Zilla' => '0',
                                        'Dist::Zilla::PluginBundle::Basic' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM}; 
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod}; 
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




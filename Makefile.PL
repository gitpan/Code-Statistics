
use strict;
use warnings;

BEGIN { require 5.006_003; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'collects and reports statistics on perl code',
  'AUTHOR' => 'Christian Walde <mithaldu@yahoo.de>',
  'BUILD_REQUIRES' => {
    'FileHandle' => '0',
    'Test::Builder::Module' => '0',
    'Test::Class' => '0',
    'Test::Differences' => '0',
    'Test::MockObject' => '0',
    'Test::More' => '0',
    'Test::Perl::Critic::Progressive' => '0',
    'Test::Simple' => '0.96',
    'Try::Tiny' => '0',
    'parent' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Code-Statistics',
  'EXE_FILES' => [],
  'LICENSE' => 'unrestricted',
  'NAME' => 'Code::Statistics',
  'PREREQ_PM' => {
    'App::Cmd::Setup' => '0',
    'Carp' => '0',
    'Config::INI::Reader' => '0',
    'Data::Section' => '0',
    'File::Find::Rule' => '0',
    'File::Find::Rule::Perl' => '0',
    'File::HomeDir' => '0',
    'File::Slurp' => '0',
    'Hash::Merge' => '0',
    'JSON' => '0',
    'List::MoreUtils' => '0',
    'List::Util' => '0',
    'Module::Pluggable' => '0',
    'Moose' => '0',
    'Moose::Exporter' => '0',
    'Moose::Role' => '0',
    'Moose::Util::MetaRole' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'MooseX::HasDefaults::RO' => '0',
    'PPI::Document' => '0',
    'Path::Class' => '0',
    'Template' => '0',
    'Term::ProgressBar::Simple' => '0'
  },
  'VERSION' => '1.102360',
  'test' => {
    'TESTS' => 't/*.t'
  }
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




use strict;
use warnings;

package Code::Statistics::Metric::ccomp;
BEGIN {
  $Code::Statistics::Metric::ccomp::VERSION = '1.102390';
}

# ABSTRACT: measures the cyclomatic complexity of a target

use Moose;
extends 'Code::Statistics::Metric';

use Perl::Metrics::Simple::Analysis::File;


sub measure {
    my ( $class, $target ) = @_;

    # not sure whether this is the right way to go, but sub-classing looks like
    # decidedly more work, to do the same exact thing
    my $s = bless {}, 'Perl::Metrics::Simple::Analysis::File';

    # setup default lists for keywords and operators
    %Perl::Metrics::Simple::Analysis::File::LOGIC_KEYWORDS = map { $_ => 1 } @Perl::Metrics::Simple::Analysis::File::DEFAULT_LOGIC_KEYWORDS;
    %Perl::Metrics::Simple::Analysis::File::LOGIC_OPERATORS = map { $_ => 1 } @Perl::Metrics::Simple::Analysis::File::DEFAULT_LOGIC_OPERATORS;

    my $complexity = $s->measure_complexity( $target );

    return $complexity;
}

1;

__END__
=pod

=head1 NAME

Code::Statistics::Metric::ccomp - measures the cyclomatic complexity of a target

=head1 VERSION

version 1.102390

=head2 measure
    Returns the cyclomatic complexity of the given target.

=head1 AUTHOR

Christian Walde <mithaldu@yahoo.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Christian Walde.

This is free software, licensed under:

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, Version 2, December 2004

=cut


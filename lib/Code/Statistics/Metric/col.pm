use strict;
use warnings;

package Code::Statistics::Metric::col;
BEGIN {
  $Code::Statistics::Metric::col::VERSION = '1.102360';
}

# ABSTRACT: measures the starting column of a target

use Moose;
extends 'Code::Statistics::Metric';


sub measure {
    my ( $class, $target ) = @_;
    my $line = $target->location->[2];
    return $line;
}

1;

__END__
=pod

=head1 NAME

Code::Statistics::Metric::col - measures the starting column of a target

=head1 VERSION

version 1.102360

=head2 measure
    Returns the starting column of the given target.

=head1 AUTHOR

Christian Walde <mithaldu@yahoo.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Christian Walde.

This is free software, licensed under:

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, Version 2, December 2004

=cut


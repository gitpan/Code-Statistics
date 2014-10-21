use strict;
use warnings;

package Code::Statistics::Metric::sdepth;
BEGIN {
  $Code::Statistics::Metric::sdepth::VERSION = '1.102370';
}

# ABSTRACT: measures the scope depth of a target

use Moose;
extends 'Code::Statistics::Metric';


sub measure {
    my ( $class, $target ) = @_;

    my @parent_list = $class->_get_parents( $target );

    my $depth = @parent_list - 1;

    return $depth;
}

sub _get_parents {
    my ( $class, $target ) = @_;
    my $parent = $target->parent;
    return $target if !$parent;
    return ( $target, $class->_get_parents( $parent ) );
}

1;

__END__
=pod

=head1 NAME

Code::Statistics::Metric::sdepth - measures the scope depth of a target

=head1 VERSION

version 1.102370

=head2 measure
    Returns the scope depth of the given target.

=head1 AUTHOR

Christian Walde <mithaldu@yahoo.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Christian Walde.

This is free software, licensed under:

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, Version 2, December 2004

=cut


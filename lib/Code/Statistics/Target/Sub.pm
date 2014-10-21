use strict;
use warnings;

package Code::Statistics::Target::Sub;
BEGIN {
  $Code::Statistics::Target::Sub::VERSION = '1.102370';
}

# ABSTRACT: represents a sub in perl code

use Moose;
extends 'Code::Statistics::Target';


sub find_targets {
    my ( $class, $file ) = @_;
    return $file->ppi->find( 'PPI::Statement::Sub' );
}

1;

__END__
=pod

=head1 NAME

Code::Statistics::Target::Sub - represents a sub in perl code

=head1 VERSION

version 1.102370

=head2 find_targets
    Returns all PPI::Structure::Block elements found in the given file.

=head1 AUTHOR

Christian Walde <mithaldu@yahoo.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Christian Walde.

This is free software, licensed under:

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, Version 2, December 2004

=cut


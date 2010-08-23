## no critic
package Code::Statistics::SlurpyConstructor::Role::Attribute;
BEGIN {
  $Code::Statistics::SlurpyConstructor::Role::Attribute::VERSION = '1.102351';
}

# ABSTRACT: Internal class for Code::Statistics::SlurpyConstructor

use Moose::Role;

has slurpy => (
    is          => 'ro',
    isa         => 'Bool',
    default     => 0,
);

before attach_to_class => sub {
    my ( $self, $meta ) = @_;

    return if not $self->slurpy;

    my @slurpy =
      map { $_->name }
      grep { $_->slurpy }
      $meta->get_all_attributes;

    if ( scalar @slurpy ) {
        my $message = sprintf(
            "Can't add mutliple slurpy attributes to a class, attempting to add '%s', existing slurpy attribute '%s'",
            $self->name,
            $slurpy[ 0 ],
        );
        die $message;
    }
};

no Moose::Role;

1;



=pod

=head1 NAME

Code::Statistics::SlurpyConstructor::Role::Attribute - Internal class for Code::Statistics::SlurpyConstructor

=head1 VERSION

version 1.102351

=head1 NAME

Code::Statistics::SlurpyConstructor::Role::Attribute - Internal class for
L<Code::Statistics::SlurpyConstructor>.

=head1 AUTHOR

Christian Walde <mithaldu@yahoo.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Christian Walde.

This is free software, licensed under:

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, Version 2, December 2004

=cut


__END__


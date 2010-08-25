## no critic
package Code::Statistics::SlurpyConstructor;
BEGIN {
  $Code::Statistics::SlurpyConstructor::VERSION = '1.102370';
}

# ABSTRACT: temporary clone of MooseX::SlurpyConstructor with some fixes

use Moose;
use Moose::Exporter;
use Moose::Util::MetaRole;
use Code::Statistics::SlurpyConstructor::Role::Object;
use Code::Statistics::SlurpyConstructor::Role::Attribute;

Moose::Exporter->setup_import_methods;

sub init_meta {
    my ( undef, %args ) = @_;

    Moose->init_meta( %args );

    my $for_class = $args{ for_class };

    Moose::Util::MetaRole::apply_metaroles(
        for               => $for_class,
        class_metaroles   => {
            attribute => ['Code::Statistics::SlurpyConstructor::Role::Attribute'],
        },
    );

    Moose::Util::MetaRole::apply_base_class_roles(
        for               => $for_class,
        roles                   => ['Code::Statistics::SlurpyConstructor::Role::Object'],
    );
    return $for_class->meta;
}

no Moose;

__PACKAGE__->meta->make_immutable;


__END__
=pod

=head1 NAME

Code::Statistics::SlurpyConstructor - temporary clone of MooseX::SlurpyConstructor with some fixes

=head1 VERSION

version 1.102370

=head2 init_meta

=head1 NAME

Code::Statistics::SlurpyConstructor - L<MooseX::SlurpyConstructor> with a few temporary fixes

=head1 SEE ALSO

=over 4

=item L<MooseX::SlurpyConstructor>

=back

=head1 AUTHOR

Christian Walde <mithaldu@yahoo.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Christian Walde.

This is free software, licensed under:

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, Version 2, December 2004

=cut


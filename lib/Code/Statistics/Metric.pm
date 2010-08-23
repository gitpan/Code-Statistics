use strict;
use warnings;

package Code::Statistics::Metric;
BEGIN {
  $Code::Statistics::Metric::VERSION = '1.102350';
}

# ABSTRACT: base class for Code::Statistic metrics

use 5.004;

use Module::Pluggable search_path => __PACKAGE__, sub_name => 'all';


sub measure {
    my ( $class, $target ) = @_;
    return;
}


sub incompatible_with {
    my ( $class, $target ) = @_;
    return 0;
}


sub supports {
    my ( $class, $target ) = @_;
    return 1;
}

1;

__END__
=pod

=head1 NAME

Code::Statistics::Metric - base class for Code::Statistic metrics

=head1 VERSION

version 1.102350

=head2 measure
    Returns the metric of the given target.
    Is called with the metric class name and a target object of unspecified
    type.
    This function should be overridden with specific logic to actually retrieve
    the metric data.

=head2 incompatible_with
    Returns true if the given target is explicitly not supported by this metric.
    Is called with the metric class name and a string representing the target
    identifiers after 'Code::Statistics::Target::'.
    Default is that all metrics are compatible with all targets.

=head2 supports
    Returns true if the given target is supported by this metric.
    Is called with the metric class name and a string representing the target
    identifiers after 'Code::Statistics::Target::'.
    Default is that all metrics are compatible with all targets.

    Has higher precedence than 'incompatible_with' and should be used to
    incompatibilities set by other targets.

=head1 AUTHOR

Christian Walde <mithaldu@yahoo.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Christian Walde.

This is free software, licensed under:

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, Version 2, December 2004

=cut


use strict;
use warnings;
package RT::Extension::TicketPreview;

our $VERSION = '0.01';

=head1 NAME

RT-Extension-TicketPreview - Show a snippet of the ticket message in search results

=head1 DESCRIPTION

This extension adds a snippet of the ticket message to the search results preview.

=head1 INSTALLATION

=over

=item C<perl Makefile.PL>

=item C<make>

=item C<make install>

May need root permissions

=item Edit your F</opt/rt4/etc/RT_SiteConfig.pm>

If you are using RT 4.2 or greater, add this line:

    Plugin('RT::Extension::TicketPreview');

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 AUTHOR

David Schmidt E<lt>davewood@gmx.atE<gt>

=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2016 by David Schmidt

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut

1;

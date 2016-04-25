package RT::Ticket;

use strict;
use warnings;

sub TicketPreview {
    my $self       = shift;
    my $res        = $self->Attachments();
    my $attachment = $res->First;
    return '' unless $attachment;
    my $content = $attachment->Content;
    return '' unless $content;
    open( my $fh, '<', \$content ) or die $!;
    my @preview = ();
    while ( my $line = <$fh> ) {
        # rm html tags
        $line =~ s/\<.*?\>//xmsg;
        # ignore empty lines
        push( @preview, $line ) if ( $line !~ m/^\s*$/xms );
        last if scalar @preview >= 3;
    }
    return join('', @preview);
}

1;

package RT::Ticket;

use strict;
use warnings;
use Encode qw/decode_utf8/;

sub TicketPreview {
    my $self        = shift;
    my $attachment = $self->_get_first_plain_att;
    return '' unless $attachment;
    my $content = $attachment->Content;
    return '' unless $content;
    return _get_preview($content);
}

sub _get_preview {
    my ($content) = @_;
    my $num_lines  = RT->Config->Get('TicketPreview')->{num_lines};
    open( my $fh, '<', \$content ) or die $!;
    my @lines = ();
    while ( my $line = <$fh> ) {
        next if $line =~ m/^\s*$/xms; # ignore empty lines
        push( @lines, $line );
        last if scalar @lines >= $num_lines;
    }
    my $preview = join('', @lines);
    return decode_utf8($preview);
}

sub _get_first_plain_att {
    my $self        = shift;
    my $attachments = $self->Attachments();
    while ( my $att = $attachments->Next ) {
        return $att if $att->ContentType eq 'text/plain';
    }
}

1;

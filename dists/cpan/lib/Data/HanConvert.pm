package Data::HanConvert;
1;

__END__

=encoding utf8

=head1 NAME

Data::HanConvert - The data for converting between traditional and simplified Chinese languages.

=head1 DESCRIPTION

This distribution does not contain code but data to be used by other programs.
They are split into 4 modules that needs to be seperately required.

   use Data::HanConvert::cn2tw;
   use Data::HanConvert::cn2tw_characters;
   use Data::HanConvert::tw2cn;
   use Data::HanConvert::tw2cn_characters;

Once required, these corresponding hashref are available:

   $Data::HanConvert::cn2tw
   $Data::HanConvert::cn2tw_characters
   $Data::HanConvert::tw2cn
   $Data::HanConvert::tw2cn_characters

The one named with "_characters" suffix contains only character-to-character
mapping, while the other contains only phrase-to-phrase mapping. The mapping are
split into different files because they are significantly larger and may not be
required depending on the scenario of use.

Notice that this data set is for conversion purposes. The phrases dataset are
not necessarily containing only valid dictionary phrases, but may contain random
long-ngrams solely for disambiguation purposes. Users are encourged to review
the data set before using this data for other purposes.

=head1 AUTHORS

Audrey Tang <audreyt@audreyt.org> -- the origial data collection work from L<Encode::HanConvert>

Yo-An Lin <cornelius@cpan.org> -- The php builder

Kang-min Liu <gugod@gugod.org>

=head1 LICENCE

This work is L<CC0|http://creativecommons.org/publicdomain/zero/1.0/>.

To the extent possible under law, Kang-min Liu has waived all copyright and
related or neighboring rights to Data::HanConvert. This work is published from:
Taiwan.

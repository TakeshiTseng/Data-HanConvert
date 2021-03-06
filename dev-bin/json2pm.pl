#!/usr/bin/env perl
use strict;
use IO::All;
use JSON qw(from_json decode_json);
use Data::Dumper;
use Data::Dump qw(dump);
use FindBin qw($Bin);

my $libdir   = io->catdir($Bin, "..", "dists", "cpan", "lib");
my $sharedir = io->catdir($Bin, "..", "share");

for my $file ($sharedir->all_files) {
    next unless $file->filename =~ /_hash\.json$/;
    my ($varname) = $file->filename =~ m/_(.+)_hash/;
    if ($file->filename =~ /characters/) {
        $varname .= "_characters";
    }
    my $data = decode_json($file->slurp);

    my $dumper = Data::Dumper->new([$data], ["\$Data::HanConvert::${varname}"]);
    $dumper->Indent(0);

    my $src = "# Generated. Do not edit this file.\npackage Data::HanConvert::$varname;\n";
    $src .= $dumper->Dump;
    io->catfile($libdir, "Data", "HanConvert", "${varname}.pm")->assert->utf8->print($src);
}

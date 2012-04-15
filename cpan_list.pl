#!/usr/bin/env perl -w

use CPAN;

# list all modules on my disk and note the newer versions
for $mod (CPAN::Shell->expand("Module", "/./")) {
  next unless $mod->inst_file;

  # here only when installed
  if ($mod->inst_version eq "undef") {
    printf "%s :No VERSION\n", $mod->id;
  }
  elsif ($mod->uptodate) {
    printf "%s %s\n", $mod->id, $mod->inst_version
  }
  else {
    # here when not up to date
    printf "%s %s, NEW VERSION=%s\n", $mod->id, $mod->inst_version,
      $mod->cpan_version;
  }
}

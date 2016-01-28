unit module Mangle;

our $command = 'translate-bin';

multi sub translate($text) {
  state $fwd = False; $fwd = !$fwd;
  translate($text, $fwd);
}

multi sub translate($text, $fwd where *.so) {
  run $command, '-s', 'systran', '-f', 'en', '-t', 'fr', :out;
}

multi sub translate($text, $fwd where *.not) {
  run $command, '-s', 'systran', '-f', 'fr', '-t', 'en', :out;
}

sub mangle($text) { (translate($text) xx 10)[* - 1] }

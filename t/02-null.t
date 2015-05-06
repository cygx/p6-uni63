use v6;

use Test;
use Uni63;

plan 4;

is Uni63::enc("\x00"), '_0';
is Uni63::dec('_0'), "\x00";
is Uni63::dec(Uni63::enc("\x00")), "\x00";
is Uni63::enc(Uni63::dec('_0')), '_0';

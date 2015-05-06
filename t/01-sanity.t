use v6;

use Test;
use Uni63;

plan 4;

my \IN1 = 'Leberkäse';

my $enc = Uni63::enc(IN1);
ok so $enc ~~ / ^ <[0..9a..zA..Z_]>+ $ /;
ok $enc.comb(/_/) == 1;

my $dec = Uni63::dec($enc);
is $dec, IN1;

my \IN2 = q:to/__END__/;
    Over hill, over dale,
    Thorough bush, thorough brier,
    Over park, over pale,
    Thorough flood, thorough fire,
    I do wander everywhere.
    __END__

is Uni63::dec(Uni63::enc(IN2)), IN2;

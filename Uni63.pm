module Uni63;

my constant ENC = @('0'..'9', 'a'..'z', 'A'..'Z');
my constant DEC = %(ENC.pairs.invert);

our sub enc($_) {
    join '', .comb.map: {
        when / <[0..9a..zA..Z]> / { $_ }
        default {
            my $cp = .ord;
            my @digits;
            while $cp {
                @digits.unshift(ENC[$cp % 62]);
                $cp div= 62;
            }
            join '', '_', +@digits, @digits;
        }
    }
}

our sub dec($_) {
    join '', .comb(/ _ (<[0..9]>) <[0..9a..zA..Z]> ** { +$0 } || . /).map: {
        when .chars > 1 {
            my $cp = 0;
            for .substr(2).comb {
                $cp *= 62;
                $cp += DEC{$_};
            }
            $cp.chr;
        }
        default { $_ }
    }
}

# TITLE

Uni63

# SYNOPSIS

```
    use Uni63;

    my $enc = Uni63::enc('Leberkäse');
    my $dec = Uni63::dec($enc);
```


# DESCRIPTION

A Unicode encoding scheme suitable for name mangling.

The 62 alphanumeric ASCII characters encode themselves. A 63th character `_` is
used to mark escape sequences.

The escape character is followed by a single digit, indicating the number of
characters that encode the next Unicode codepoint. Contrary to the module name,
the codepoint is encoded in base-62 with digits `0..9`, `a..z`, `A..Z`.

The decoder does not validate its input:

  * an underscore that is not followed by a valid escape sequence will be
    passed through, ie re-encoding a decoded string may not round trip

  * the numeric value of any escape sequence that follows the given scheme
    will be passed on to `chr`, even if the value lies outside the range of
    Unicode codepoints


# LICENSE

Boost Software License, Version 1.0

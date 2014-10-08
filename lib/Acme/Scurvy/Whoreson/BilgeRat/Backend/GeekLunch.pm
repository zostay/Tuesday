package Acme::Scurvy::Whoreson::BilgeRat::Backend::GeekLunch;
use base 'Acme::Scurvy::Whoreson::BilgeRat';

sub new {
    my $class = shift;

    bless {
        occupations => [ qw(
            developer designer engineer tester analyst
            ), 'systems administrator', 'marketing specialist', 
        ],
        adjectives => [ qw(
            good bad ugly sharp dull acceptable passable decent
            unassuming unobtrusive obtuse astonishing admirable
        ) ],
        languages => [ qw(
            ASP.net PHP Perl Python Ruby Java C C++ C# Go Fortran
            COBOL BASIC JavaScript FoxPro
            ), 'Visual Basic', 'MS Access'
        ],
        domains => [ qw(
            Linux Windows Macintosh Apple Android iOS embedded
            ), 'Windows XP', 'Windows 98', 'Windows 95', 'Windows CE',
            'Windows 2000', 'Windows NT', 'Windows Server 2003',
            'Windows Vista', 'Windows 7', 'Windows 8', 'Windows 10',
            'OS X', 'Raspberri Pi', 'web', 'Atari', 'Commodore 64',
            'Unix', 'Solaris', 'SunOS',
        ],
        grammars => [ qw( O AO LO DO ALO ADO LDO DLO ALDO ADLO ) ],
    }, $class;
}

sub generateinsult {
        my($self, %usedwords, $insult) = (shift);
        foreach my $element (split(//, $self->{grammars}->[rand @{$self->{grammars}}])) {
                my $word = '';
                my $counter = 0;
                while(!$word || $usedwords{$word}) {
                        $word = (uc $element eq 'O') ? $self->{occupations}->[rand @{$self->{occupations}}] :
                                (uc $element eq 'A') ? $self->{adjectives}->[rand @{$self->{adjectives}}] :
                                (uc $element eq 'L') ? $self->{languages}->[rand @{$self->{languages}}] :
                                (uc $element eq 'D') ? $self->{domains}->[rand @{$self->{domains}}] :
                                die("The bleep who wrote your backend bleeped up");
                        return '' if(++$counter == 100);
                }
                $usedwords{$word} = 1;
                $insult .= (($insult) ? ' ' : '').$word;
        }
        $insult;
}

1;

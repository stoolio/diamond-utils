    Extended          Common

    0  : D : 00000    0 : D : 000
    1  : E : 00001    1 : E : 001
    2  : F : 00010    2 : F : 010
    3  : G : 00011    3 : G : 011
    4  : H : 00100    4 : H : 100
    5  : I : 00101    5 : I : 101
    6  : J : 00110    6 : J : 110
    7  : K : 00111    7 : K : 111
    8  : L : 01000
    9  : M : 01001
    10 : N : 01010
    11 : O : 01011
    12 : P : 01100
    13 : Q : 01101
    14 : R : 01110
    15 : S : 01111
    16 : T : 10000
    17 : U : 10001
    18 : V : 10010
    19 : W : 10011
    20 : X : 10100
    21 : Y : 10101
    22 : Z : 10110

We can encode any color into 5 bits. Most diamonds are (off the top of my head) between D and K grades, so we can encode the color (for most diamonds) in only 3 bits.

    Extended            Common

    0  : FL   : 0000    0 : VS1 : 00
    1  : IF   : 0001    1 : VS2 : 01
    2  : VVS1 : 0010    2 : SI1 : 10
    3  : VVS2 : 0011    3 : SI2 : 11
    4  : VS1  : 0100
    5  : VS2  : 0101
    6  : SI1  : 0110
    7  : SI2  : 0111
    8  : SI3  : 1000
    9  : I1   : 1001
    10 : I2   : 1010
    11 : I3   : 1011

Clarities like SI3 are only present on EGL certificates, so it makes sense to have them around. As above, most diamonds clarity grade can be encoded in only 2 bits.

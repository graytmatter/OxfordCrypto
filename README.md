# OxfordCrypto

These are the tools I built for my secondary Crypto tutorial at Oxford in the Spring of 2018.

EC_Factors.sage contains a (good enough for this project though not fully generalized) Eliptic curve framework, and uses that framework to impliment Hendrik Lenstra's factoring algorithm.

Pollard.sage contains a simple implementation of Pollard's p-1 factoring algorithm which assumes that p-1 is B smooth.

primitive_poly.py contains a system for generating primitive polynomials which can be used to create full orbit pseudo-random number generators.
regexp_m17n [![Build Status](https://travis-ci.org/os97673/regexp_m17n.svg?branch=master)](https://travis-ci.org/os97673/regexp_m17n)
===========
Сhange non_empty? method in lib/regexp_m17n.rb to make test pass (but it must use regexp)

We are ok with changing the test to skip dummy encoding but it will be interesting to either pass some string with dummy encoding to non_empty? and make this work too or prove that this is impossible.
I.e. (officially) skipping dummy is acceptable solution for the contest but solution with test(s) for dummy encoding(s) will be even better.

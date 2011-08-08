# Trains

I found the trains problem to be the most interesting of the 3 problems
given to me to solve. I believe the other 2 would be much easier, so I
decided to go with the hardest.

At first glance of the problem, I noticed that it was a "Travelling
Salesman" type problem. Interstingly enough, I've solved a similar
problem in C++ before which can be seen on my GitHub page:

https://github.com/keithpitt/airport-best-path

After further looking into the problem, I realised that it wasn't so
easy as the normal algorithims used to solve the "Travelling Salesman"
problem. Paths are not mutual, and nor do they have the same weighting.

I have satisfied all the criteria supplied. My test suite sets up a
dataset as described in the problem, and I have automated tests to
ensure that my code works as described.

To run the test suite, simply run:

    rake spec

## Tools Used

* Ruby 1.9.2-p290
* RSpec
* Rake
* Bundler
* RVM

## References

* http://en.wikipedia.org/wiki/Travelling_salesman_problem

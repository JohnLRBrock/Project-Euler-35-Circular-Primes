My solution to Project Euler 35: Circular Primes

Circular Prime: A prime who's every rotation is also prime

Example: 197, 971, 719

how many circular primes are there under 1 million?

I copied my implementation of the sieve of Eratosthenes from my solution to PE 27: Quadratic Primes with a small tweak for efficiency.

The bulk of the work is done by #circular_prime?(). On my machine the program takes less than one second.
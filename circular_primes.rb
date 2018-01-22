# John Brock
# 2018-01-18
# https://projecteuler.net/problem=35
# 
# Circular Prime: A prime who's every rotation is also prime
# Example: 197, 971, 719
# how many circular primes are there under 1 million?

# sieve of eratosthenes
def sieve_of_eratosthenes(max)
  list = Array.new(max + 1, true)
  list[0] = false
  list[1] = false
  list.each_with_index do |bool, index|
    if bool
      i = 0
      while (index ** 2 + (index * i)) <= max
        list[index** 2 + (index * i)] = false
        i += 1
      end
    end
  end
  list
end

def prime?(n)
  return $sieve[n] if $sieve && $sieve.length > n + 1
  if $sieve
    while $sieve.length < n + 1
      $sieve = sieve_of_eratosthenes($sieve.length * 2)
    end
  else
    $sieve = sieve_of_eratosthenes(n + 1)
  end
  return $sieve[n]
end

# int -> int
def rotate(n)
  string = n.to_s
  return false if string.length < 2
  string.prepend(string[string.length - 1]).chop.to_i
end

def circular_prime?(n)
  return true if n < 10 && prime?(n)
  return false unless prime?(n)
  (n.digits.length - 1).times do
    n = rotate(n)
    return false unless prime?(n)
  end
  return true
end

def circular_prime_count(limit)
  n = 1
  count = 0
  while n < limit
    count += 1 if circular_prime?(n)
    n += 1
  end
  count
end

start = Time.now
prime_count = circular_prime_count(1000000)
finish = Time.now
puts prime_count
puts finish - start
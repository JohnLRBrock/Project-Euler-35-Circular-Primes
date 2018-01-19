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

def rotate(n)
  puts n
  array = n.to_s.split
  temp = array.slice!(0, 1)
  puts temp

  array = array.push(temp)
  output = array.join()
end

puts rotate(123)

def circular_prime?(n)
  
  return true if n.to_s.length == 1 && prime?(n)

end

def circular_prime_count(limit)
  0
end

start = Time.now
prime_count = circular_prime_count(1000000)
finish = Time.now
puts prime_count
puts finish - start
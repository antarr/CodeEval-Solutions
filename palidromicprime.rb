require 'pp'

def isPrime(number)
  prime = true
  2.upto(number) do |num|
    if number % num == 0 && num!=number
      prime = false
      break
    end
  end
  prime
end

def isPalidrome number
  return false unless number.to_s.reverse == number.to_s  
  true
end

1000.downto(2) do |n|
  if isPrime(n) && isPalidrome(n)
    then pp n
    break
  end
end


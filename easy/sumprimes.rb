
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

sum = 0
count = 0
current = 2

while count < 1000 do
  if isPrime(current) then
    sum += current
    count +=1
  end
  current +=1
end

puts sum

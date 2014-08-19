require 'pp'

path = ARGV.first

FIZZ = 3
BUZZ = 5
output = ""

file = File.open(path).readlines.each do |line|  
  words = line.strip.split(' ')
  words.each do |num|
    if num.to_i % FIZZ == 0 && num.to_i % BUZZ == 0 then
      output << " FB"
    end  
    if num.to_i % FIZZ == 0 then 
        output << " F" 
        next 
    end
    if num.to_i % BUZZ == 0 then 
        output << " B" 
        next 
    end
    output << " #{num}"
  end
end

pp output
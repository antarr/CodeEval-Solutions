lines  = []

File.open(ARGV.first).readlines.each { |line| lines << line.strip }

def print_multiplier(f, d)
  current = d
  multiplier = 2    
  while current <= f do
    current = d * multiplier
    multiplier += 1
  end
  puts current
end

lines.each do |line|
  line.strip!
  vals = line.split(',')
  floor = vals.first.to_i
  divisor = vals.last.to_i
  print_multiplier(floor, divisor)
end
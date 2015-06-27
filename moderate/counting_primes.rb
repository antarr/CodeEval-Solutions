require 'prime'

File.open(ARGV[0]).each_line do |line|
  next if line.empty?
  j, k = line.split(',')
  j = Prime::EratosthenesGenerator.new.take_while {|i| i < j.to_i}.count
  k = Prime::EratosthenesGenerator.new.take_while {|i| i <= k.to_i}.count
  puts (k - j)
end

ARGV[0]= 'prefix.txt'
File.open(ARGV[0]).each_line do |line|
  operators = line.scan(/[\+\*\/]/).reverse
  next unless operators
  operands = line.scan(/[0-9]/)
  value = operands.shift.to_f
  operators.each do |op|
    value = value.public_send op,  operands.shift.to_f
  end
  puts value.to_i
end

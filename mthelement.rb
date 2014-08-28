ARGV[0] = 'mth.txt'
File.open(ARGV.first).readlines.each do |line|
  line.chomp!
  next if line.empty?
  elements = line.split(/[ ]/)
  elements.pop
  elements.reverse!
  m = line.split(/[ ]/).last.to_i-1
  next if m > elements.count
  puts elements[m]
end

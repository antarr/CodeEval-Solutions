def digits(line)
  line.scan(/: \d+\,/).map{ |e| e.scan(/\d+/).first.to_i }.inject(:+)
end
File.open(ARGV[0]).each_line do |line|
  next if line.empty?
  puts digits(line).to_i
end

ARGV[0]="source.txt"
File.open(ARGV[0]).readlines.each do |line|
  puts line.swapcase
end

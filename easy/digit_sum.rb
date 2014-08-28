lines  = []

File.open(ARGV.first).readlines.each { |line| lines << line.strip }

lines.each do |line|
  line.strip!
  sum = 0
  line.chars.each{ |n| sum += n.to_i }
  puts sum
end

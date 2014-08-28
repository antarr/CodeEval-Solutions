lines  = []

File.open(ARGV.first).readlines.each { |line| lines << line.strip }

degree = lines.delete_at(0).to_i

lines.sort!{ |y, x| x.length <=> y.length }

0.upto(degree-1) do |n|
  puts lines[n]
end

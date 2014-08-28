lines  = []

File.open(ARGV.first).readlines.each { |line| lines << line.strip }

lines.each do |line|
  line.strip!
  vals = line.split(',').map(&:to_i)
  n = vals[0].to_s(2)
  p1 = vals[1].to_i-1
  p2 = vals[2].to_i-1
  if n[p1] == n[p2]
    puts true
  else
    puts false
  end
end

lines  = []

File.open(ARGV.first).readlines.each { |line| lines << line.strip }

lines.each do |line|
  if line == '' then
    next
  else
    temp = line.split(' ').to_a.reverse
    words = ""
    temp.each { |t| words << t + ' '}
    puts words.strip
  end
end

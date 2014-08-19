EMAIL_REGEX = /\A[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/i

lines  = []

File.open(ARGV.first).readlines.each { |line| lines << line.strip }

lines.each do |line|
  if line =~ EMAIL_REGEX
    puts true
  else
    puts false
  end
end

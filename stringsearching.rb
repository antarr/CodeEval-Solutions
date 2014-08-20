File.open(ARGV.first).each_line do |line|
  str, val = line.chomp.split(',')
  next unless str
  puts Regexp.new(val.gsub(/(?<!\\)\*/, '[A-Za-z0-9]*')) =~ str ? 'true' : 'false'  
end
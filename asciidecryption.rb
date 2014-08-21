File.open(ARGV.first).each_line do |line|
  size, last_char, *chars = line.chomp.gsub(/[\|]/,'').split(' ')
  next unless size
  chars.each do |c|
    print "".concat(c.to_i) , ' '
  end    
  puts ''    
end
def find_key(len,ending, str)
  str.split('40').each do |word|
    if len.to_i && str.scan(word).count > 1
      bytes = word.split(' ')
      next unless bytes.count == len.to_i
      return bytes.last.to_i - ending.strip.bytes.to_a.first.to_i
    end
  end
end

File.open(ARGV.first).each_line do |line|
  begin
    len, terming_char, str = line.chomp.split('|')
    next unless str
    key = find_key(len, terming_char,str)
    str.strip.split(/[ ]/).each{ |char| print "".concat(char.to_i-key.to_i) }
    puts ''
  rescue
    puts ''
  end
end

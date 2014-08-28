File.open(ARGV[0]).readlines.each do |line|
  line.chomp!
  next if line.empty?
  upcount = line.scan(/[A-Z]/).count*1.00
  downcount = line.scan(/[a-z]/).count*1.00
  total = upcount + downcount
  print "lowercase: ", '%.2f' % ((downcount/total)*100), " uppercase: ",'%.2f' % ((upcount/total)*100)
  puts ''
end

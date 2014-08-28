File.open(ARGV.first).readlines.each do |line|
  line.chomp!
  next if line.empty?
  line.scan(/[a-z]/i).each do |str|
    if line.scan(/#{str}/).count == 1
      puts str
      break
    end
  end
end

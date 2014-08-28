ARGV[0] = 'lowestuniquen.txt'


File.open(ARGV[0]).each_line do |line|
  line.gsub!(/\s/,'')
  next if line.empty?
  ary = line.chars.to_a
  uniques = line.chars.select{ |u| line.scan(/#{u}/).count == 1}
  min = uniques.empty? ? 0 :uniques.sort.first
  puts min == 0 ? min : ary.index(min)+1
end

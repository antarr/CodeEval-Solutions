ARGV[0]='rmvchar.txt'

File.open(ARGV.first).readlines.each do |line|
  str, scrub = line.chomp.split(/,/);
  next unless scrub
  str.split(' ').each{ |word| print word.gsub(/[#{scrub}]/,''), ' '}
  puts ''
end

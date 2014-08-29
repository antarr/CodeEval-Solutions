ARGV[0]= 'strperm.txt'
File.open(ARGV[0]).each_line do |line|
  pattern = line.gsub(/[a-z0-9]/i,'.')
  next unless pattern
  array = line.scan(/[a-z0-9]/i)
  perms = array.permutation(array.count).sort
  tmp = []
  perms.each{|p| tmp << p.join('')}
  puts tmp.join(',')
end

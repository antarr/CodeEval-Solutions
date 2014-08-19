File.open(ARGV.first).readlines.each do |line| 
  line.strip!
  groups = []    
  parts = line.split(';')
  set = parts[0].split(',').to_a   
  k = parts[1].to_i;

  current = set.shift(k)
    
  while current.count % k == 0 do
    groups << current.to_a.reverse
    current = set.shift(k)
  end    
  groups << current.to_a.reverse
  puts groups.flatten.join(",")
end
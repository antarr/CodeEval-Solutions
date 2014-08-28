File.open(ARGV.first).each_line do |line|
  *values, k = line.chomp.split(/[,;]/)
  next unless k
  puts values.each_slice(k.to_i).flat_map { |grp| grp.count < k.to_i ? grp : grp.reverse }.join(',')
end

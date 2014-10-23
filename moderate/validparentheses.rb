def isValid str
  return true if str.empty?
  return false if str.length.odd?
  isValid(str.gsub("()",""))
end
File.open(ARGV[0]).each_line do |line|
 next if line.chomp!.empty?
 parentheses = line.scan(/[\(\)]/).join.gsub("()","")
 puts isValid(parentheses) ? "True" : "False"
end

def isValid str
  return true if str.empty?
  return false if str.scan(/\{\}|\(\)|\[\]/).empty?
  isValid(str.gsub!(/\{\}|\(\)|\[\]/,""))
end
File.open(ARGV[0]).each_line do |line|
 next if line.chomp!.empty?
 puts isValid(line) ? "True" : "False"
end

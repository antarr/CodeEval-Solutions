File.open(ARGV[0]).each_line do |line|
  words = line.scan(/[a-zA-Z]{1,100}/).join(',')
  numbers = line.scan(/\d+/).join(',')
  if words != "" and numbers != ""
    puts [words, numbers].join('|')
  elsif words != ""
    puts words
  else
    puts numbers
  end
end

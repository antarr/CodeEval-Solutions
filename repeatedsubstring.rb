ARGV[0]= "repeated.txt"

def substrings str
  pattern = '.'
  subs = []
  while pattern.length < str.length do
    subs << str.scan(/(?=(#{pattern}))/)
    pattern << '.'
  end
  subs.flatten.sort_by{ |s| "banana".index('#{s}')}
end

File.open(ARGV[0]).readlines.each do |line|
  longest = ""
  current = line.strip
  next unless current
  if substrings(line) == substrings(line).uniq
    puts "NONE"
    next
  end
  line.split(/[ ]/).each do |word|
    subs = substrings(word)
    subs.each do |sub|
      if line.scan(/#{sub}/).count > 1 && sub.length > longest.length
        longest = sub
      end
    end
  end
  puts longest == "" ? 'NONE' : longest
end

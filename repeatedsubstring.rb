ARGV[0]= "repeated.txt"

def substrings str
  pattern = '.'
  subs = []    
  while pattern.length <= (str.length/2) do
    subs << str.scan(/(?=(#{pattern}))/)
    pattern << '.'  
  end 
  subs.flatten
end

File.open(ARGV[0]).readlines.each do |line|
  next if line.strip!.empty?    
  longest = ""
  subs = substrings(line).reject{ |r| r.strip.empty? }
  if subs == subs.uniq
    puts "NONE"
    next
  end
  substrings(line).reject{ |r| r.strip.empty? }.each do |word|
    if line.scan(/#{word}/).count > 1 && word.length > longest.length
      longest = word
    end
  end
  puts longest == "" ? 'NONE' : longest
end

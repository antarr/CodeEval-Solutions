File.open(ARGV[0]).each_line do |line|
  alphas =  ('a'..'z').to_a
  digits = (0..9).to_a

  digit_map = alphas.zip(digits).to_h
  matches = false
  if line.scan(/[a-j0-9]/).empty?
    puts "NONE"
  else
    line.chars.each do |c|
      print c if c =~ /\d/
      print digit_map[c] if c=~ /[a-j]/      
    end
    print "\n"
  end
end

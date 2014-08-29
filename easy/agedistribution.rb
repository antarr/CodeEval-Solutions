ARGV[0]="aged.txt"
File.open(ARGV[0]).readlines.each do |line|
  age = line.to_i
  next unless age
  case age
    when 0..2
      puts "Still in Mama's arms"
    when 3..4
      puts "Preschool Maniac"
    when 5..11
      puts "Elementary school"
    when 12..14
      puts "Middle school"
    when 15..18
      puts "High school"
    when 19..22
      puts "College"
    when 23..65
      puts "Working for the man"
    when 66..100
      puts "The Golden Years"
    else
      puts "This program is for humans"
    end
end

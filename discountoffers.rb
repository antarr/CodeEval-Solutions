ARGV[0] = "dscntoffer.txt"

def have_common_factor n, m
  (n % m == 0) || (m % n == 0)
end

def find_sutability cust, prod
  cust_l, prod_l = cust.length, prod.length
  ss = prod_l.even? ? cust.scan(/[aeiouy]/i).length*1.5 : cust.scan(/[^aeiouy]/i).length*1.0
  ss *= have_common_factor(prod_l, cust_l) ? 1.5 : 1.0
end

lines = []
File.open(ARGV[0]).readlines.each{ |line| lines << line.gsub!(/[^a-z\,\;]/i,'') }

lines.each do |line|
  customers = line.split(/[;]/).first.split(/[,]/)
  products = line.split(/[;]/).last.split(/,/)
  next unless products
  pairs = products.product customers
  totals = []

  customers.each do |customer|
    total = 0
    customer_pairs = pairs.select{ |pair| pair.last == customer}
    customer_pairs.each  do|pair|
      total += ss = find_sutability(customer, pair.first)
    end
    totals << total
  end

  puts '%.2f' % totals.max
end

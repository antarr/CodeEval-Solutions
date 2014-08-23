ARGV[0] = "dscntoffer.txt"

def have_common_factor n, m
  (n % m == 0) || (m % n == 0)
end

def find_sutability cust, prod
  cust_l, prod_l = cust.length, prod.length
  ss = prod_l.even? ? cust.scan(/[aeiouy]/i).length*1.5 : cust.scan(/[^aeiouy]/i).length.to_f*1.0
  ss *= have_common_factor(prod_l, cust_l) ? 1.5 : 1.0
end

lines = []
File.open(ARGV[0]).readlines.each{ |line| lines << line.gsub!(/[^a-z\,\;]/i,'') }

lines.each do |line|
  customers = line.split(/[;]/).first.split(/[,]/)
  products = line.split(/[;]/).last.split(/,/)
  next unless products
  pairs = products.product customers
  maxs = []

  products.each do |product|
    max = 0
    product_pairs = pairs.select{ |pair| pair.first == product}
    product_pairs.each  do|pair|
      ss = find_sutability(pair.first, pair.last)
      max = ss unless max >= ss
    end
    maxs << max
  end

#  customers.each do |customer|
#    sutability_hash = Hash.new
#    products.each do |product|
#      sutability_hash[product.to_s] = find_sutability(customer, product)
#    end
#    maxs << sutability_hash.values.max.round(2)
#  end
#  next unless maxs.count > 0
  puts '%.2f' % maxs.inject(:+)
end

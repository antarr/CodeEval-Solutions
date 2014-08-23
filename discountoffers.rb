ARGV[0] = "dscntoffer.txt"

def share_mulitple n, m
  intersect =[n,m].inject(:lcm)
  return intersect <= n || intersect <= m
end

def find_sutability product, customer
  if product.length.even?
    ss = customer.scan(/[aeiouy]/i).count*1.5
  else
    ss = customer.scan(/[^aeiouy]/i).count*1.0
  end
  ss  *= share_mulitple(product.length, customer.length) ? 1.5 : 1.0
end

lines = []

File.open(ARGV[0]).readlines.each{ |line| lines << line.gsub(/[^a-z\,\;]/i,'') }

lines.each do |line|
  cust_str, prod_str = line.split(/[;]/i)
  next unless prod_str
  customers = cust_str.split(/[,]/i)
  next unless customers
  products = prod_str.split(/[,]/i)
  next unless products
  pairs = products.product(customers)
  maxes = 0
  products.each do |prod|
    max = 0
    product_pairs = pairs.select{ |c| c[0] = prod}
    product_pairs.each do |pair|
      ss = find_sutability(pair.first, pair.last)
      max = ss unless max >= ss
    end
    maxes +=max
  end
 puts '%.2f' % maxes
end

ARGV[0] = "dscntoffer.txt"

def share_mulitple n, m
  intersect =[n,m].inject(:lcm)
  return intersect <= n || intersect <= m
end

def find_sutability product, customer
  ss  = share_mulitple(product.length, customer.length) ? 1.5 : 1.0
  if product.length.even?
    ss *= customer.scan(/[aeiouy]/i).length*1.5
  else
    ss *= customer.scan(/[^aeiouy]/i).length*1.0
  end
  ss
end

File.open(ARGV[0]).readlines.each do |line|
  line = line.chomp.gsub(/[^a-z\,\;]/i,'')
  cust_str, prod_str = line.split(/[;]/i)
  next unless prod_str
  customers = cust_str.split(/[,]/i)
  next unless customers
  products = prod_str.split(/[,]/i)
  next unless products
  maxs = []
  customers.each do |customer|
    sutability_hash = Hash.new
    products.each do |product|
      sutability_hash[product.to_s] = find_sutability(product, customer)
    end
    maxs << sutability_hash.values.max
  end
  next unless maxs.count > 0
  puts '%.2f' % maxs.inject(:+)
end

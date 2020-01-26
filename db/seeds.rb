# frozen_string_literal: true

file = File.read('SpocketProducts.json')
products = JSON.parse(file)

products.map do |product|
  Product.create(product)
end

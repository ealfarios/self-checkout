require_relative './cart_item'
require_relative './shopping_cart'

shopping_cart = ShoppingCart.new
keep_scanning = true

puts "WELCOME TO THE SELF-CHECKOUT MACHINE! 👋 🖥"

while keep_scanning
  cart_item = CartItem.new

  while !cart_item.valid_category?
    puts "Enter 'product category' (options: books, food, medical, other):"
    cart_item.category = gets.chomp.downcase
    puts "No a valid category! ❌" unless cart_item.valid_category?
  end

  puts "Enter 'product NAME' (🔤❗️):"
  cart_item.name = gets.chomp

  puts "Enter 'product PRICE' (🔢❗️):"
  cart_item.price = gets.chomp.to_f

  puts "Enter 'product QUANTITY' (🔢❗️):"
  cart_item.quantity = gets.chomp.to_i

  puts "Enter 'y' if this an IMPORTED PRODUCT (👀❓)"
  cart_item.imported = gets.chomp.downcase == "y"

  cart_item.set_totals

  shopping_cart.items << cart_item

  puts "Enter 'y' to KEEP SCANNING more products (👀❓)"
  keep_scanning = gets.chomp.downcase == "y"
end

puts "========= *** YOUR RECEIPT *** ========="

shopping_cart.print_receipt

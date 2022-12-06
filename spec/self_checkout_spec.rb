require "shopping_cart"
require "cart_item"

describe ShoppingCart do
  context "Input 1" do
    let(:input_1) do
      [
        { category: "books", name: "book", price: 12.49,  quantity: 2, imported: false},
        { category: "other", name: "music CD", price: 14.99,  quantity: 1, imported: false},
        { category: "food", name: "chocolate bar", price: 0.85,  quantity: 1, imported: false}
      ]
    end
    let(:expected_result) do
      [
        "2 book: 24.98",
        "1 music CD: 16.49",
        "1 chocolate bar: 0.85",
        "Sales Taxes: 1.50",
        "Total: 42.32",
      ]
    end

    it "outputs correct values in receipt" do
      shopping_cart = ShoppingCart.new

      input_1.each do |item|
        cart_item = CartItem.new(item[:category], item[:name], item[:price], item[:imported], item[:quantity])
        cart_item.set_totals
        shopping_cart.items << cart_item
      end

      receipt = shopping_cart.output

      expect(receipt).to include(expected_result[0])
      expect(receipt).to include(expected_result[1])
      expect(receipt).to include(expected_result[2])
      expect(receipt).to include(expected_result[3])
      expect(receipt).to include(expected_result[4])
    end
  end

  context "Input 2" do
    let(:input_2) do
      [
        { category: "food", name: "box of chocolates", price: 10.00,  quantity: 1, imported: true},
        { category: "other", name: "bottle of perfume", price: 47.50,  quantity: 1, imported: true}
      ]
    end
    let(:expected_result) do
      [
        "1 imported box of chocolates: 10.50",
        "1 imported bottle of perfume: 54.65",
        "Sales Taxes: 7.65",
        "Total: 65.15"
      ]
    end

    it "outputs correct values in receipt" do
      shopping_cart = ShoppingCart.new

      input_2.each do |item|
        cart_item = CartItem.new(item[:category], item[:name], item[:price], item[:imported], item[:quantity])
        cart_item.set_totals
        shopping_cart.items << cart_item
      end

      receipt = shopping_cart.output

      expect(receipt).to include(expected_result[0])
      expect(receipt).to include(expected_result[1])
      expect(receipt).to include(expected_result[2])
      expect(receipt).to include(expected_result[3])
    end
  end

  context "Input 3" do

    let(:input_3) do
      [
        { category: "other", name: "bottle of perfume", price: 27.99,  quantity: 1, imported: true},
        { category: "other", name: "bottle of perfume", price: 18.99,  quantity: 1, imported: false},
        { category: "medical", name: "packet of headache pills", price: 9.75,  quantity: 1, imported: false},
        { category: "food", name: "boxes of chocolates", price: 11.25,  quantity: 3, imported: true}
      ]
    end

    

    let(:expected_result) do
      [
        "1 imported bottle of perfume: 32.19",
        "1 bottle of perfume: 20.89",
        "1 packet of headache pills: 9.75",
        "3 imported boxes of chocolates: 35.45",
        "Sales Taxes: 7.80",
        "Total: 98.28"
      ]
    end

    it "outputs correct values in receipt" do
      shopping_cart = ShoppingCart.new

      input_3.each do |item|
        cart_item = CartItem.new(item[:category], item[:name], item[:price], item[:imported], item[:quantity])
        cart_item.set_totals
        shopping_cart.items << cart_item
      end

      receipt = shopping_cart.output

      expect(receipt).to include(expected_result[0])
      expect(receipt).to include(expected_result[1])
      expect(receipt).to include(expected_result[2])
      expect(receipt).to include(expected_result[3])
      expect(receipt).to include(expected_result[4])
      expect(receipt).to include(expected_result[5])
    end
  end
end
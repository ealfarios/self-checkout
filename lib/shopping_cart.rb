class ShoppingCart
  attr_accessor :items
  attr_reader :sales_tax, :total

  def initialize(items: [])
    @items = items
  end

  def output
    total_taxes = items.sum { |item| item.sales_tax }
    total_costs = items.sum { |item| item.total }

    output_details = items.map { |item| item.show_details }

    output_details << "Sales Taxes: #{formatted_amount(total_taxes)}"
    output_details << "Total: #{formatted_amount(total_costs)}"

    output_details
  end

  def print_receipt
    items.each do |product|
      puts product.show_details
    end
  end

  private

  def formatted_amount(amount)
    sprintf('%.2f', amount)
  end
end

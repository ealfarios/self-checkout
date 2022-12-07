class ShoppingCart
  attr_accessor :items
  attr_reader :sales_tax, :total

  def initialize(items: [])
    @items = items
  end

  def output
    output_details = items.map(&:show_details)
    output_details + grand_totals
  end

  def print_receipt
    items.each { |product| puts product.show_details }
    grand_totals.each { |total_detail| puts total_detail }
  end

  private

  def total_taxes
    items.sum(&:sales_tax)
  end

  def total_costs
    items.sum(&:total)
  end

  def grand_totals
    [
      "Sales Taxes: #{formatted_amount(total_taxes)}",
      "Total: #{formatted_amount(total_costs)}"
    ]
  end

  def formatted_amount(amount)
    sprintf("%.2f", amount)
  end
end

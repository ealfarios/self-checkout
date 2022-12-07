require_relative "./product"

class CartItem < Product
  SALES_TAX_RATE = 0.1
  IMPORT_DUTY_TAX_RATE = 0.05
  TAX_EXEMPT_CATEGORIES = %w[books food medical]

  attr_accessor :quantity
  attr_reader :cost, :sales_tax, :total

  def initialize(category = "", name = "", price = 0, imported = false, quantity = 0)
    super(category, name, price, imported)
    @quantity = quantity
  end

  def show_details
    "#{quantity} #{imported ? "imported " : ""}#{name}: #{sprintf("%.2f", total)}"
  end

  def set_totals
    rounded_item_tax = round_nearest_05(item_tax)
    @sales_tax = rounded_item_tax * quantity
    @total = (price + rounded_item_tax) * quantity
  end

  private

  def tax_exempt?
    TAX_EXEMPT_CATEGORIES.include? category
  end

  def item_tax
    tax = imported ? price * IMPORT_DUTY_TAX_RATE : 0
    return tax if tax_exempt?
    tax += price * SALES_TAX_RATE
  end

  def round_nearest_05(value)
    (value * 20).ceil.to_f / 20
  end
end

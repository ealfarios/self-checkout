require_relative './product'

class CartItem < Product
  SALES_TAX_RATE = 0.1
  IMPORT_DUTY_TAX_RATE = 0.05
  TAX_EXEMPT_CATEGORIES = ["books", "food", "medical"]

  attr_accessor :quantity
  attr_reader :cost, :sales_tax, :total

  def initialize(category = "", name = "", price = 0, imported = false, quantity = 0)
    super(category, name, price, imported)
    @quantity = quantity
  end

  def show_details
    "#{quantity} #{imported ? "imported " : ""}#{name}: #{sprintf('%.2f', total)}"
  end

  def tax_exempt?
    TAX_EXEMPT_CATEGORIES.include? category
  end

  def set_totals
    set_cost
    set_sales_tax

    @total = (cost + sales_tax).round(2)
  end

  def set_cost
    @cost = price * quantity
  end

  def set_sales_tax
    @sales_tax = imported ? cost * IMPORT_DUTY_TAX_RATE : 0

    if tax_exempt?
      round_sales_tax
      return
    end
    
    @sales_tax += cost * SALES_TAX_RATE
    round_sales_tax
  end

  def round_sales_tax
    @sales_tax = (((@sales_tax * 20).ceil.to_f) / 20)
  end
end
class Product
  CATEGORIES = %w[books food medical other]

  attr_accessor :category, :name, :price, :imported

  def initialize(category = "", name = "", price = 0, imported = false)
    @category = category
    @name = name
    @price = price
    @imported = imported
  end

  def valid_category?
    CATEGORIES.include? category
  end
end

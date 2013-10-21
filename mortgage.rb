require 'pry'
class HomePurchaseOption

attr_reader :address, :property_value, :selling_price, :down_payment

  def initialize(address, property_value, selling_price, down_payment)
    @address = address
    @property_value = property_value
    @selling_price = selling_price
    @down_payment = down_payment
    @@property_list << self
  end

  @@property_list = []

  def self.property_list
    @@property_list
  end

  #the amount of cash value you have in the home
  #This would be difference in your property's value
  #and your mortgage balance
  def equity_after_sale
    @property_value - @selling_price
  end

  #the amount of money you must borrow to purchase the home
  def required_mortgage
    @selling_price - @down_payment
  end

  #how much your insurance cost will cost over `years` years
  def insurance_cost(years)
    if pmi_required?
      years * 0.005 * required_mortgage
    else
      0
    end
  end

  private
  #determine if the purchaser must pay insurance
  def pmi_required?
    down_payment.to_f / property_value.to_f < 0.2
  end
end


properties =[
  ["43 Fenmore Lane", 439000, 419000, 20000],
  ["58 Johnson Way", 512000, 524000, 105000],
  ["32 Silver Lane", 485000, 490000, 97000],
  ["45 Fenway Drive", 465000, 460000, 93000],
  ["54 Denise Drive", 445000, 450000, 98000]
]

properties.each do |address, property_value, selling_price, down_payment|
  HomePurchaseOption.new(address, property_value, selling_price, down_payment)
end

HomePurchaseOption.property_list.each do |property|
  puts "*** #{property.address} ***"
  puts "Equity after sale: #{property.equity_after_sale}"
  puts "Required mortgage: #{property.required_mortgage}"
  puts "2 year insurance cost: #{property.insurance_cost(2)}"
  puts ""
end




require 'pry'
income = [
  {
    first_name: 'Johnny',
    last_name: 'Smith',
    annual_income: 120000,
    tax_paid: 28000
  },
  {
    first_name: 'Liz',
    last_name: 'Lemon',
    annual_income: 95000,
    tax_paid: 21000
  },
  {
    first_name: 'Jane',
    last_name: 'Doe',
    annual_income: 140000,
    tax_paid: 30000
  },
  {
    first_name: 'Mike',
    last_name: 'Orsillio',
    annual_income: 40000,
    tax_paid: 8800
  }
]

def calculate_tax_due(hash)
  hash[:annual_income] * 0.22
end

def calculate_tax_diff(hash, difference)
  hash[:tax_paid] - difference
end

def display_liability(hash, due)
  "#{hash[:first_name]} #{hash[:last_name]} has a tax liability of #{due}"
end

def display_tax(hash, difference)
  if difference > 0
    "#{hash[:first_name]} #{hash[:last_name]} will receive a refund of #{difference}"
  elsif difference < 0
    "#{hash[:first_name]} #{hash[:last_name]} owes  #{difference * (-1)}"
  end
end

def run_calculations(collection)
  collection.each do |person|
    tax_due = calculate_tax_due(person)
    tax_diff = calculate_tax_diff(person, tax_due)
    puts display_liability(person, tax_due)
    puts display_tax(person, tax_diff)
  end
end

run_calculations(income)

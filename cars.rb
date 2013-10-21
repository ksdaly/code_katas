class Car
  @@makes = {}

  def initialize(color, make, model)
    @color = color
    if valid_make?(make)
      @make = make
    else
      puts "Invalid make #{make}"
    end
    if valid_model?(make, model)
      @model = model
      else
      puts "Invalid model #{model}"
    end
  end

  def self.valid_make?(make)
    valid_makes.has_key?(make)
  end

  def self.valid_model?(make, model)
    self.valid_make?(make) && valid_makes[make].include?(model)
  end

  def self.add_make(make)
    make.each do |key, value|
      unless @@makes.has_key?(key)
        @@makes.merge!(make)
      else
        @@makes[key] += value
      end
    end
  end

  def self.valid_makes
    @@makes
  end
end

Car.add_make({'ford' => ['focus', 'taurus']})
Car.add_make({'toyota' => ['camry', 'corolla']})
Car.add_make({'ford' => ['new']})

puts Car.valid_makes.inspect
puts Car.valid_make?('ford')
puts Car.valid_make?('audi')
puts Car.valid_model?('ford', 'taurus')
puts Car.valid_model?('GMC', 'taurus')

puts Car.valid_model?('toyota', 'camry')
puts Car.valid_model?('toyota', 'taurus')

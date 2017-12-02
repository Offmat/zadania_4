# klasa testowa

class Dog
  attr_accessor :name
  def initialize
    @name = 'Sonia'
  end

  def my_name
    puts @name.to_s
  end
end

class Test
  def animal
    @animal ||= Dog.new
  end
end

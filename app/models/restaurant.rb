class Restaurant
  attr_accessor :name, :reviews, :customers, :restaurant

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @reviews = []
    @customers = nil
  end

  def self.all
    @@all
  end

  def self.find_by_name name
    @@all.find { |i| i.name == name}
  end

  def reviews
    self.reviews
  end

  def customers
    self.reviews.collect { |i|
      i.customer }
  end

end

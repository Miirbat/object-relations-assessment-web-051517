class Review
  attr_accessor :restaurant, :customer, :content
  @@all = []

  def initialize restaurant, content
    @restaurant = restaurant
    @content = content
    restaurant.add_review(self)
    self.restaurant = restaurant
    @@all << self
  end

  def self.all
    @@all
  end

  def customer
    self.customer
  end

  def restaurant
    # @@all.find { |i|
    # if i.restaurant == review.restaurant
    #   i.restaurant }
    self.restaurant
  end

end

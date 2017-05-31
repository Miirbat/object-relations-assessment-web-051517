
class Customer
  attr_accessor :first_name, :last_name, :reviews, :restaurant

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @reviews = []
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name name
    newVar = name.split(' ')
    @@all.find { |i|
    i.first_name == newVar[0] && i.last_name == newVar[1] }
  end

  def self.find_all_by_first_name name
    @@all.find_all { |i| i.first_name == name }
  end

  def self.all_names
    @@all.map {|i| i.full_name }
  end

  def add_review restaurant, content
    newReview = Review.new(restaurant, content)
    @reviews << newReview
    newReview.customer = self
    newReview.restaurant = restaurant
  end

end


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
    self.restaurant
  end

end


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

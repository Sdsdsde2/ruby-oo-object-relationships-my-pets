require 'pry'
class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(owner_name)
    @name = owner_name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
    @@all.count
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_to_buy)
    cat_to_buy = Cat.new(cat_to_buy, self)
  end

  def buy_dog(dog_to_buy)
    dog_to_buy = Dog.new(dog_to_buy, self)
  end

  def walk_dogs
    Dog.all.select {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.select {|cat| cat.mood = "happy"}
  end

  def sell_pets
    Cat.all.select {|cat| cat.mood = "nervous" and cat.owner = nil}
    Dog.all.select {|dog| dog.mood = "nervous" and dog.owner = nil}
  end

  def list_pets
    @dog_count = 0
    @cat_count = 0
    Cat.all.select {|cat| cat.owner == self and @cat_count += 1}
    Dog.all.select {|dog| dog.owner == self and @dog_count += 1}
    "I have #{@dog_count} dog(s), and #{@cat_count} cat(s)."
  end
end
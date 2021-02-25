class Dog
  
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(pet_name, owner)
    @name = pet_name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
  
end
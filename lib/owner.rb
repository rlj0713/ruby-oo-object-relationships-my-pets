class Owner
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.uniq.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(new_cat_name)
    new_cat_name = Cat.new(new_cat_name, self)     
  end

  def buy_dog(new_dog_name)
    new_dog_name = Dog.new(new_dog_name, self)     
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.cats.each { |cat| cat.mood = "nervous" }
    self.dogs.each { |dog| dog.mood = "nervous" }
    self.cats.each { |cat| cat.owner = nil }
    self.dogs.each { |dog| dog.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end


end
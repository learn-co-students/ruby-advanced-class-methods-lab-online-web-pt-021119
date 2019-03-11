require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_instance = self.new
    new_instance.save
    new_instance
  end

  def self.new_by_name(name)

  end

  def self.create_by_name(name)

  end

  def self.find_by_name(name)

  end

  def self.new_from_filename(file)

  end

  def self.create_by_filename(file)

  end

  def self.alphabetical

  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end
end

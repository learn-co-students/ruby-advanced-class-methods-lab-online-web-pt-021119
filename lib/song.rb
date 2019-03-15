require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name = nil)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    self.create(name)
  end

  def self.create_by_name(name)
    song = self.create(name)
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == name
      self.find_by_name(name).name
    else
      binding.pry
      self.create_by_name(name)
    end
  end

end

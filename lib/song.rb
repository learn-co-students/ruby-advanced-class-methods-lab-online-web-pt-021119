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

  def self.create(name = nil, artist_name = nil)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
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
    binding.pry
    if self.find_by_name(name) == name
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

end

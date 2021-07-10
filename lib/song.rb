require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song_name = self.new 
    self.all << song_name
    song_name
  end
  
  def self.new_by_name(name)
    song_name = self.new 
    song_name.name = name 
    song_name
  end
  
  def self.create_by_name(name)
    song_name = self.new
    song_name.name = name
    @@all << song_name
    song_name
  end
  
  def self.find_by_name(name)
    @@all.find { |x| x.name == name }
  end
  
  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(file)
    a = file.split(" - ")
    a2 = a[1].split(".")
    a3 = [a[0], a2[0]] # need a better way of doing this
    new_song = self.new 
    new_song.name = a3[1]
    new_song.artist_name = a3[0]
    new_song
  end
  
  def self.create_from_filename(file)
    a = file.split(" - ")
    a2 = a[1].split(".")
    a3 = [a[0], a2[0]]
    new_song = self.new 
    new_song.name = a3[1]
    new_song.artist_name = a3[0]
    @@all << new_song
  end
  
  def self.destroy_all
    @@all.clear
  end

end

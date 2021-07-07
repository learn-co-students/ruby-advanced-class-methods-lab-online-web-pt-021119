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

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song_new = self.new
    song_new.name = name
    song_new
  end

  def self.create_by_name(name)
    song_new = self.new_by_name(name)
    song_new.save
    song_new
  end

  def self.find_by_name(name)
    self.all.find { |x| x.name == name }
end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(name)
    arr = name.split(" - ")
    song_name = arr[1].chomp(".mp3")
    song = self.new_by_name(song_name)
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(name)
    self.all << self.new_from_filename(name)
  end

  def self.destroy_all
    self.all.clear
  end

end

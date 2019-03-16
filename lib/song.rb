require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all ||= []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    s = self.new
    s.save
    s
  end

  def self.new_by_name(song_name)
    s = self.new
    s.name = song_name
    s
  end

  def self.create_by_name(song_name)
    s = self.new
    s.save
    s.name = song_name
    s
  end

  def self.find_by_name(song_name)
    self.all.detect {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    s = self.new
    s.artist_name = filename.split(" - ")[0]
    s.name = filename.split(" - ")[1].chomp(".mp3")
    s
  end

  def self.create_from_filename(filename)
    s = self.new
    s.save
    s.artist_name = filename.split(" - ")[0]
    s.name = filename.split(" - ")[1].chomp(".mp3")
    s
  end

  def self.destroy_all
    self.all.clear
  end

end

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
    music = Song.new
    music.save
    music
  end

  def self.new_by_name (name)
    music=Song.new
    music.name = name
    music
  end

  def self.create_by_name(name)
    music=Song.new
    music.name = name
    music.save
    music
  end

  def self.find_by_name(name)
    @@all.map.find{|inst|inst.name==name}
  end

  def self.find_or_create_by_name(name)
    #binding.pry
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name) 
  end
  
  def self.alphabetical
    @@all.sort_by{|a|a.name}
  end

  def self.new_from_filename(file)
    a=file[0..file.size-5].split(' - ')
    music =Song.new
    music.name = a[1]
    music.artist_name=a[0]
    music
  end
  
  def self.create_from_filename(file)
    music=self.new_from_filename(file)
    music.save
    music
  end

  def self.destroy_all
    @@all=[]
  end

end

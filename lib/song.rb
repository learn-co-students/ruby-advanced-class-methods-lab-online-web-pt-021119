require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  #def initialize(name)
  #  @name = name
  #end
  
  def self.create
    song = self.new
    #song.name =  name
    @@all << song
    song
  end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(name)
   song = self.new 
   song.name = name 
   song 
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    @@all << song 
    song 
  end 
    
  def self.find_by_name(name)
    @@all.find{|song|song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) #instance of song or nil
      self.find_by_name(name) #instance of song
    else
      create_by_name(name) #create new song instance by name
    end 
  end 

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name}
  end 
  
  def self.new_from_filename(file_name)
    song = self.new
    song.name = file_name.split(" - ")[1].split(".")[0]
    song.artist_name = file_name.split(" - ")[0]
    song
  end 
    
  def self.create_from_filename(file_name)
    song = self.new
    song.name = file_name.split(" - ")[1].split(".")[0]
    song.artist_name = file_name.split(" - ")[0]
    song.save
    song
  end 
  
  def self.destroy_all
    @@all.clear
  end 
end 

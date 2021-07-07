class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def self.create
    song = self.new 
    song.save
    song
  end
  
  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end
  
  def self.create_by_name(string)
    song = self.new 
    song.name = string 
    song.save
    song
 end
 
 def self.find_by_name(string)
  # song = self.new
  # song.name = string
   self.all.find {|s| s.name == string}
 end
 
 def self.find_or_create_by_name(string_of_song)
   
  # song = self.all.find {|s| s.name == string_of_song}
  # if song == nil
  #   new_song = self.new
  #   new_song.name = string_of_song
  #   new_song.save
  #   new_song
  # else
  #   song
  # end
  self.find_by_name(string_of_song) || self.create_by_name(string_of_song)
  
 end
 def self.alphabetical
   self.all.sort_by {|s| s.name}
 end
 def self.new_from_filename(name)
   song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
 end
 
 def self.create_from_filename(name)
   song = self.new 
   song.name = (name.split(" - ")[1].chomp(".mp3"))
   song.artist_name = (name.split(" - ")[0])
   @@all << song
   song
 end
 def self.destroy_all
   self.all.clear
 end

  
  def save
    self.class.all << self
  end

end

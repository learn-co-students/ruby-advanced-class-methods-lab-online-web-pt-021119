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

  def Song.create
    song = self.new
    @@all << song 
    song.save
    song
  end
  
  def Song.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end 
  
  def Song.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save
    song
  end   
  
  def Song.find_by_name(song_name)
    songs_name = nil
    self.all.each do |song|
      if song.name == song_name
      songs_name = song
      else 
      end 
   end 
   songs_name
  end
  
  def Song.find_or_create_by_name(song_name)
      if Song.find_by_name(song_name)
        Song.find_by_name(song_name)
      else
      Song.create_by_name(song_name)
   end 
  end 
  
  def Song.alphabetical
    self.all.sort_by do |song|
    song.name
    end
  end 
  
  def Song.new_from_filename(filename)
    song = self.new 
    
    filenames = filename.split(" - ")
    song_name = filenames[1].gsub(".mp3","")
    artist = filenames[0]  
    song.name = song_name
    song.artist_name = artist
    song
    #binding.pry
  end 
  
 
  def Song.create_from_filename(filename)
    song = self.new
   filenames = filename.split(" - ")
    song_name = filenames[1].gsub(".mp3","")
    artist = filenames[0]  
    song.name = song_name
    song.artist_name = artist
    song.save
 end 
 
 
  def Song.destroy_all
    @@all = []
  end
    
end

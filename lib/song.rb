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
   new_song = self.new
   @@all << new_song
   new_song
 end

  def self.new_by_name(name)
   new_song = self.new
   new_song.name = name
   new_song
  end

 def self.create_by_name(name)
   new_song = self.new
   new_song.name = name
   @@all << new_song
   new_song
  end

  def self.find_by_name(name)
   @@all.detect {|x| x.name == name }
  end

 def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
 end

 def self.alphabetical
    @@all.sort_by! {|x| x.name }
end

 def self.new_from_filename(song_file)
    new_song = self.new
    x = song_file.split('-')[1]
    y = song_file.split('-')[0]
    new_song.name = x.strip.split('.')[0]
    new_song.artist_name = y.strip
    new_song
end

  def self.create_from_filename(song_file)
    new_song = self.new
    x = song_file.split('-')[1]
    y = song_file.split('-')[0]
    new_song.name = x.strip.split('.')[0]
    new_song.artist_name = y.strip
    @@all << new_song
    new_song
end

 def self.destroy_all
  @@all.clear
 end
end

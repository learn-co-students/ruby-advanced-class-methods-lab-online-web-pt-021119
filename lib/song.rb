class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    # Song.all << self
    # @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |sName|
      sName.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.create_by_name(song_name)
    self.find_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |sName|
      sName.name
    end
  end

  def self.new_from_filename(file)
    # Split the filename's name, removing '-' & '.mp3'
    dashRemoval = file.split(" - ")
    artist_name = dashRemoval[0]
    song_name = dashRemoval[1].split(".mp3").join(" ")
    
    # Iniializing the separated Strings to .name & .artist_name
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    dashRemoval = file.split(" - ")
    artist_name = dashRemoval[0]
    song_name = dashRemoval[1].split(".mp3").join(" ")
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

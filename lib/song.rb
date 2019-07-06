class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #class constructor
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title) #class constructor
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title) #class constructor
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)  #class finder
    found_name = self.all.find {|song| song.name == title}
    found_name
  end

  def self.find_or_create_by_name(title) #class finder and class constructor
    found_name = self.find_by_name(title)
    if found_name
      found_name
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical #class operator
    alphabetized_song_list = self.all.sort_by {|song| song.name}
    alphabetized_song_list
  end

  def self.new_from_filename(filename)
    song_list = filename.split(" - ")
    song_list[1] = song_list[1].chomp(".mp3")
    song = self.new
    song.name = song_list[1]
    song.artist_name = song_list[0]
    song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    song = self.create
    song.name = new_song.name
    song.artist_name = new_song.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end





end

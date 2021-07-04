class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name_)
    song = Song.new
      # @name = name_ Got stuck on this for 10 mins. :P Cant access @ in self.method
    song.name = name_
    song.save
    song
  end

  def self.create_by_name(name_)
    song = Song.new
    song.name = name_
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort { |x,y| x.name <=> y.name }
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    song_title = filename.split(" - ")[1].chomp('.mp3')

    song = Song.create_by_name(song_title)
    song.artist_name = artist
    song

  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    song_title = filename.split(" - ")[1].chomp('.mp3')

    song = Song.create_by_name(song_title)
    song.artist_name = artist
    song.save
    song

  end

  def self.destroy_all
    Song.all.clear    
  end

end

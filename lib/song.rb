class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(song)do
    @song = song
  end

  def self.all
    @@all
    song = Song.new_by_name("The Middle")
    song = Song.find_or_create_by_name("Blank Space")
    song.name
  end

  def save
    self.class.all << self
    song = Song.new_by_name("The Middle")
    Song.find_or_create_by_name("Blank Space")
    song = Song.create
    Song.all.include?(song)
  end

end

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

  end


end

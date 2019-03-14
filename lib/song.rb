class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
	  new_song = self.new
	  self.all << new_song
	  new_song
  end
  
  def self.new_by_name(name)
	  new_song = self.new
	  new_song.name = name
	  new_song
  end

  def self.create_by_name(name)
	  new_song = self.create
	  new_song.name = name
	  new_song
  end

  def self.find_by_name(name)
	  self.all.find {|person|
		  person.name == name
	  }
  end

  def self.find_or_create_by_name(name)
	  self.find_by_name(name) || self.create_by_name(name)
  end

  def self.new_from_filename(filename)
	  m = filename.match(/(.*) - (.*).mp3/)
	  new_song = self.new_by_name(m[2])
	  new_song.artist_name = m[1]
	  new_song
	  #binding.pry
  end

  def self.create_from_filename(filename)
	  m = filename.match(/(.*) - (.*).mp3/)
	  new_song = self.create_by_name(m[2])
	  new_song.artist_name = m[1]
	  new_song
  end

  def self.alphabetical
	  self.all.sort_by {|song| song.name}
  end
	  
  def self.all
    @@all
  end

  def self.destroy_all
	  @@all.clear
  end

end

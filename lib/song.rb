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
    jam = Song.new
    jam.save
    jam
  end

 def self.new_by_name(song_name)
    jam = Song.new
    jam.name = song_name
    jam
  end

  def self.create_by_name(song_name)
    jam = Song.new
    jam.name = song_name
    @@all.push(jam)
    jam
  end

  def self.find_by_name(song_name)
  @@all.find{|song| song.name == song_name}
  end


  def self.find_or_create_by_name(song_name)
    # song_found = @@all.find{|song| song.name == song_name}
    song_found = find_by_name(song_name)
    if song_found == nil
    self.create_by_name(song_name)
    # jam = Song.new
    # jam.name = song_name
    # jam
    else
    song_found
    end
  end

def self.alphabetical
  @@all.sort_by{ |song| song.name}
end

def self.new_from_filename(file_name)
#Taylor Swift - Blank Space.mp3
new_array = file_name.split(/[-.]/)
jam = Song.new
jam.name = new_array[1].strip
jam.artist_name = new_array[0].strip
jam
# artist_name = new_array[0].strip
# song = new_array[1].strip
# new_song = "#{artist} and #{song}"
# new_song
end


def self.create_from_filename(file_name)
#Taylor Swift - Blank Space.mp3
new_array = file_name.split(/[-.]/)
jam = Song.new
jam.name = new_array[1].strip
jam.artist_name = new_array[0].strip
@@all.push(jam)
jam
# artist_name = new_array[0].strip
# song = new_array[1].strip
# new_song = "#{artist} and #{song}"
# new_song
end

# def self.test(new_song)
# jam = Song.new
# jam.name = "Vimal"
# jam
# end


def self.destroy_all
  @@all.clear
end


end

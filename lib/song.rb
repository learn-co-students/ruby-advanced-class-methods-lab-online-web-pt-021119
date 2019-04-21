require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all()
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create()
    song = self.new
    song.save
    song
    # @@all << song
    # return song
end

def self.new_by_name(title)
  song = self.new
  song.name = title
  song
end

def self.create_by_name(title)
  song = self.create
  song.name = title
  song
  # @@all.push(song)  song
end

def self.find_by_name(title)
  # self.all.detect{|s| s.name == title}
found = nil
@@all.each do |song|
  if song.name == title
    found = song
  end
end
found
end

def self.find_or_create_by_name(title)
# self.find_by_name(title)
# found = nil
# @@all.each do |song|
#   if song.name == title
#     found = song
#   end
# end
# found
songlookup = nil
songlookup = self.find_by_name(title)
  if songlookup == nil
    # self.create_by_name(title)
      # song = self.new
      # song.name = title
      # @@all.push(song)
      # song
      songlookup = self.create_by_name(title)
    end
    songlookup
end





def self.alphabetical
  self.all.sort_by{|s| s.name}
end

def self.new_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end



end

# blank_space = Song.find_by_name("Blank Space")
# binding.pry

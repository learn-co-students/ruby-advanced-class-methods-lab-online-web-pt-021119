class Song

  #New song is initialize w/these properties
  attr_accessor :name, :artist_name

  #Class variables
  @@count = 0 #<-class variable, counter keeps track of new songs added
  @@all = []
  @@genres = []
  @@artists = []

  #This is the *reader* for the `.create` class constructor above
  def self.all
    @@all
  end

  def save
    self.class.all << self #`self` is the object, `class.all` represents @@all
  end

#Class constructor that initializes a song & saves it to the @@all class variable
  def self.create
    new_song = self.new   #<-initializes a new song & stores it in the variable new_song
    @@all << new_song     #<-saves the new song
    #new_song.save        #same as the code above it.
    new_song              #<-returns the new song
  end

#**** Start defining properties ****
#Class constructor that takes in the string name of a song & returns a song instance w/that name set as its name property & the song being saved into the @@all class variable
  def self.new_by_name(name)
    song = self.new     #instanciates new song
    song.name = name    #gives the new song a name
    song                #returns the new song w/title
  end

  def self.create_by_name(name)
    song = self.new     #instanciates new song
    song.name = name    #gives the new song a name
    song.save           #saves the new song
    song                #returns the new song w/title
  end

#Accepts the string name of a song & returns the matching instance of the song w/that name
  def self.find_by_name(name)     #Class finder
    @@all.find { |song| song.name == name }
  end

#This method accepts a string name for a song & either return a matching song instance w/that name |OR| create a new song w/the name
  def self.find_or_create_by_name(name)  #uses find_by_name & create_by_name
    self.find_by_name(name) || self.create_by_name(name)
  end

#Returns all the songs in ascending(a-z)alphabetical order.
  def self.alphabetical
    @@all.sort_by { |song| song.name }
    #@@all.sort { |a, b| a.name <=> b.name} #using comparison operator<=> to alphabetize
  end

  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end

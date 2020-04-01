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
    song = self.new 
    song.save
    song
  end
  
  def self.new_by_name(string_name)
    song = self.new 
    song.name = string_name
    song
  end 
  
  def self.create_by_name(name)
    song = self.create
    song.name = name 
    song
  end 
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end 
    end
  end 
  
  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name[0]}
  end

  def self.new_from_filename(filename)
    song_data = filename.sub!(/.mp3/,'').split(' - ')

    song = self.new
    song.artist_name = song_data[0]
    song.name = song_data[1]

    song
  end

  def self.create_from_filename(filename)
    song_data = filename.sub!(/.mp3/,'').split(' - ')

    song = self.create
    song.artist_name = song_data[0]
    song.name = song_data[1]

    song
  end


end

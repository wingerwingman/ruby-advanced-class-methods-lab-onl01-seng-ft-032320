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
  
  def self.create_by_name(string_name)
    song = self.new 
    song.name = string_name
    song.save
    song
  end 
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end
  
  def find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      result
    else
      self.create_by_name(name)
    end
  end


end

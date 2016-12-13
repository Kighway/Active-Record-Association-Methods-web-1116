class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    # songs.length #<-----WORKS ALSO!!!
    Song.select(:genre).size
  end

  def artist_count
    # return the number of artists associated with the genre
    # self.all.collect {|genre| genre.artists}.flatten.size #<-----WORKS ALSO!!!
    Artist.select(:genre).size

  end

  def all_artist_names
    # return an array of strings containing every musician's name
    Artist.all.collect {|artist| artist.name}
  end
end

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    # songs.first.genre #<-----WORKS ALSO!!!
      Song.first.genre
  end

  def song_count
    #return the number of songs associated with the artist
    # songs.count #<-----WORKS ALSO!!!
    Song.select(:artist).size
  end

  def genre_count
    #return the number of genres associated with the artist
    # songs.collect {|song| song.genre}.uniq.size #<-----WORKS ALSO!!!
    Genre.joins(:songs, :artists).size
  end
end

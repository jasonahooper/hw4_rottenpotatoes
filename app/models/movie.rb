class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_same_director(id)
    movie = Movie.find(id)
    if movie.director && movie.director != ""
      Movie.find_all_by_director(movie.director)
    else
      nil
    end
  end
end

class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def getDirector
    if !self.director || self.director==""
       "'#{self.title}' has no director info"
    else
       self.director
    end
  end
end

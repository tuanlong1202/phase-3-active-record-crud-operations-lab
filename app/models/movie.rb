class Movie < ActiveRecord::Base
    def self.create_with_title(title)
        movie = self.new(title:title)
        movie.save
        movie
    end
    def self.first_movie
        self.all.first
    end
    def self.last_movie
        self.all.last
    end
    def self.movie_count
        self.all.size
    end
    def self.find_movie_with_id(id)
        self.find_by(id:id)
    end
    def self.find_movie_with_attributes(hash)
        self.find_by(hash)
    end
    def self.find_movies_after_2002
        self.all.select do |movie|
            movie.release_date > 2002
        end
    end
    def update_with_attributes(hash)
        hash.each do |property, value|
            self.send("#{property}=", value)
        end
        self.save        
    end
    def self.update_all_titles(title)
        self.all.each do |movie|
            movie.title = title
            movie.save
        end
    end
    def self.delete_by_id(id)
        movie = self.find_movie_with_id(id)
        movie.delete
    end
    def self.delete_all_movies
        self.all.each do |movie|
            movie.delete
        end
    end
end
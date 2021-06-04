class Movie < ApplicationRecord
    has_many :genres


    def self.get_movie_info 


        img_url = "https://image.tmdb.org/t/p/w300"
        url = URI("https://api.themoviedb.org/3/movie/top_rated?api_key=6cb7579cc35c7ba28cadfc4c84a1227d&language=en-US&page=1")

        response = Net::HTTP.get(url)
        info = JSON.parse(response)

    end

    def self.make_movie

    end

    def make_genre

    end
end

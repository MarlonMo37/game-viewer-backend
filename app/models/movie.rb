class Movie < ApplicationRecord
    has_many :reviews
    has_many :movie_lists
    has_many :movie_genres
    has_many :lists, through: :movie_lists
    has_many :genres, through: :movie_genres

    def self.get_movie_info 


        img_url = "https://image.tmdb.org/t/p/w300"
        url = URI("https://api.themoviedb.org/3/movie/top_rated?api_key=6cb7579cc35c7ba28cadfc4c84a1227d&language=en-US&page=1")

        response = Net::HTTP.get(url)
        info = JSON.parse(response)
        self.make_movie(info["results"])
    end

    def self.make_movie(movies)
        img_url = "https://image.tmdb.org/t/p/w300"
        
        movies.each do |movie|
           movie_info = {}
           movie_info["title"] = movie["title"]
           movie_info["poster_url"] = img_url + movie["poster_path"]
           movie_info["summary"] = movie["overview"]
           movie_info["audience_rating"] = movie["vote_rating"]
           movie_info["release_date"] = movie["release_date"]

           self.find_or_create_by(movie_info)    
        end
    end

    def self.make_genre(movie)
        url = URI("https://api.themoviedb.org/3/genre/movie/list?api_key=6cb7579cc35c7ba28cadfc4c84a1227d&language=en-US")
        response = Net::HTTP.get(url)
        info = JSON.parse(response)
        movie_genre_ids = movie["genre_ids"]
        movie_genre_ids.each do |id|
            selected_genre = info["genres"].select {|genre| genre["id"] == id}
            genre = Genre.find_or_create_by(name: selected_genre["name"])
            movie.genres << genre
        end
    end
end

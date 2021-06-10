class Movie < ApplicationRecord
    has_many :reviews
    has_many :movie_lists
    has_many :movie_genres
    has_many :lists, through: :movie_lists
    has_many :genres, through: :movie_genres

    def self.get_movie_info 


        img_url = "https://image.tmdb.org/t/p/w300"
        url = URI("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["API_KEY"]}&language=en-US&page=1")

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

           genre_ids = movie["genre_ids"]
           selected_movie = self.find_or_create_by(movie_info)   

           self.make_genre(selected_movie, genre_ids)
        end
    end

    def self.make_genre(movie, genre_ids)
        url = URI("https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV["API_KEY"]}&language=en-US")
        response = Net::HTTP.get(url)
        info = JSON.parse(response)
        
        genre_ids.each do |id|
            selected_genre = info["genres"].select {|genre| genre["id"] == id}
            genre = Genre.find_or_create_by(name: selected_genre[0]["name"])
            if !(movie.genres.include?(genre))
                movie.genres << genre
            end
        end
    end
end

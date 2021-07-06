class MovieSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
  attributes :title, :poster_url, :summary, :audience_rating, :release_date, :id
  has_many :genres
  has_many :reviews
  
end

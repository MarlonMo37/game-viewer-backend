class MovieSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
  attributes :title, :poster_url, :summary, :audience_rating, :release_date
  has_many :genres
end

class GenreSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
  attributes :name
  has_many :movies
end

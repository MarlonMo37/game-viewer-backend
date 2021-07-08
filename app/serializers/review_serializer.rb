class ReviewSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
  attributes :written_review, :rating, :id, :movie_id

  belongs_to :movie, except: [:created_at, :updated_at]

end

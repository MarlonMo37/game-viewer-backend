class ReviewSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
  attributes :written_review, :rating, :id

  belongs_to :movie, except: [:created_at, :updated_at]

end

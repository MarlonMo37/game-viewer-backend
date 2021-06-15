class ReviewSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
  attributes :written_review, :rating

  belongs_to :movie

end

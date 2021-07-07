class Review < ApplicationRecord
    belongs_to :movie
    # belongs_to :user
    validates :written_review, presence: true
end

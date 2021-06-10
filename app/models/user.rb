class User < ApplicationRecord
    has_many :lists
    has_many :reviews
    validates :username, presence: true, uniqueness: true, length: {in: 5..30}, exclusion: {in: %w(admin superadmin user)}
    validates :email, presence: true, uniqueness: true, email: true
    has_secure_password
end

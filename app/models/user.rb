class User < ApplicationRecord
    has_many :reviews
    has_many :pet_foods, through: :reviews

    validates :username, uniqueness: true, presence: true
    has_secure_password
end
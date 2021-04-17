class PetFood < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    scope :alpha, -> { order(:name) }
end

class User < ApplicationRecord
    require "SecureRandom"
    
    has_many :reviews
    has_many :pet_foods, through: :reviews

    validates :username, uniqueness: true, presence: true
    has_secure_password

    def self.find_with_omniauth(auth)
        self.find_or_create_by(uid: auth[:uid]) do |u|
            if auth[:info][:nickname]
                u.username = auth[:info][:nickname]
            else
                u.username = auth[:info][:name]
            end
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(16)
        end
    end
end


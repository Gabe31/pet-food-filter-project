class User < ApplicationRecord
    require "SecureRandom"
    
    has_many :reviews
    has_many :pet_foods, through: :reviews

    validates :username, uniqueness: true, presence: true
    has_secure_password

    def self.find_with_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(10)
        end
    end

end
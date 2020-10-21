

class User < ApplicationRecord
    has_many :reservations
    has_many :restaurants, through: :reservations 

    has_secure_password

    validates :name, :password, :address, presence: true
    validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Please include phone number in the below format ***-***-****" }
    
#     validates :covid_status, exclusion: { in: %w(true),
#   message: "Sorry, please make a reservation when you're better" }
end
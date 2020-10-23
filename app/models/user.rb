class User < ApplicationRecord
    has_many :reservations
    has_many :restaurants, through: :reservations 

    has_secure_password

    validates :name, :password, :address, presence: true
    validates :email, uniqueness: true
    validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Please include phone number in the below format ***-***-****" }

    def past_reservation 
        self.reservations.select {|reservation| reservation.date < Time.now }
    end

    def upcoming_reservation 
        self.reservations.select {|reservation| reservation.date > Time.now }
    end 
end

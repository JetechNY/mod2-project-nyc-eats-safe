require "json"

class Restaurant < ApplicationRecord
    has_many :reservations
    has_many :menus 
    has_many :users, through: :reservations
    has_many :dishes, through: :menus

  

    def recent_reservations 
        self.reservations.select {|reservation| reservation.date > Time.now - 14.day && reservation.date < Time.now}
    end     

    def recent_users
        self.recent_reservations.map {|reservation| reservation.user}
    end 

    def recent_users_covid_status
        self.recent_users.map {|user| user.covid_status}
    end 

end

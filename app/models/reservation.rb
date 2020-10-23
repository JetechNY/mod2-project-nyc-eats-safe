class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :restaurant_id, :party_size, :date, presence: true 
  validates :party_size, numericality: { greater_than_or_equal_to:1, less_than_or_equal_to: 6 }
  
  # FIXME: validates_associated :user 



end

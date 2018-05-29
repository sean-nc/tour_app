class Booking < ApplicationRecord
  belongs_to :event
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :event_id, presence: true
  validates :number_of_guests, presence: true,
            numericality: { only_integer: true,
                            greater_than: 0 }
  validates :email, presence: true
end
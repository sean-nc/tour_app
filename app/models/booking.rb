class Booking < ApplicationRecord
  belongs_to :event
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :number_of_guests, presence: true,
            numericality: { only_integer: true,
                            greater_than: 0 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :bookings
  validates :title, presence: true
  validates :when, presence: true
  validates :duration, presence: true
  validates :details, presence: true
  validates :max_bookings, presence: true
  validates :price, presence: true
  validates :creator_id, presence: true
end
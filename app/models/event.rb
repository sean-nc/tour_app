class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :bookings, dependent: :destroy
  validates :title, presence: true
  validates :when, presence: true
  validates :duration, presence: true
  validates :details, presence: true
  validates :max_bookings, presence: true
  validates :price, presence: true
  validates :creator_id, presence: true
  default_scope { order(when: :asc) }

  def price_in_dollars
    '%.2f' % (self.price.to_i/100.0)
  end
end
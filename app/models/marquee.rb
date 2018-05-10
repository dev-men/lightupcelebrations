class Marquee < ApplicationRecord
  validates :image1, presence: true
  validates :marquee_name, presence: true
  validates :numbe_of_marquee, presence: true
  validates :address_line_1, presence: true
  validates :address_line_2, presence: true
  validates :city, presence: true
  validates :budget_per_head, presence: true
  validates :guest_capacity, presence: true

  belongs_to :user
  has_many :bookings, as: :imageable
end

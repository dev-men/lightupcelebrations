class Decorator < ApplicationRecord
  validates :image1, presence: true
  validates :compnay_name, presence: true
  validates :address_line_1, presence: true
  validates :address_line_2, presence: true
  validates :city, presence: true

  belongs_to :user
  has_many :bookings, as: :imageable
end

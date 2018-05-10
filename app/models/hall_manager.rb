class HallManager < ApplicationRecord
  validates :image1, presence: true
  validates :hall_name, presence: true
  validates :number_of_halls, presence: true
  validates :address_line_1, presence: true
  validates :address_line_2, presence: true
  validates :city, presence: true
  validates :budget_per_head, presence: true
  validates :guest_capacity, presence: true

  belongs_to :user
  has_many :bookings, as: :imageable
end

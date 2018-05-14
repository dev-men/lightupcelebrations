class Booking < ApplicationRecord
  validates :day, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :location, presence: true

  belongs_to :user
  belongs_to :imageable, polymorphic: true
end

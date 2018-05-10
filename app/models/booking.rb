class Booking < ApplicationRecord
  validates :start, presence: true
  validates :end, presence: true
  validates :location, presence: true
  belongs_to :imageable, polymorphic: true
  belongs_to :user
end

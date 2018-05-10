class Photographer < ApplicationRecord
  validates :image1, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :equipments, presence: true
  validates :city, presence: true
  validates :mayo, presence: true
  validates :mehndi, presence: true
  validates :barat, presence: true
  validates :walima, presence: true
  validates :party, presence: true
  validates :other, presence: true

  belongs_to :user
  has_many :bookings, as: :imageable
end

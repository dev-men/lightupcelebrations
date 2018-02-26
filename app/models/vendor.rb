class Vendor < ApplicationRecord
  validates :name, presence: true
	validates :cnic, presence: true
	validates :number, presence: true

	validates :cnic, length: { is: 13 }
	validates :number, length: { is: 11 }

	belongs_to :user
  has_many :hall_managers
end

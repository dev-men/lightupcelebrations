class Decorator < ApplicationRecord
  validates :image1, presence: true
  validates :company_name, presence: true
  validates :address_line_1, presence: true
  validates :address_line_2, presence: true
  validates :city, presence: true

  belongs_to :user
end

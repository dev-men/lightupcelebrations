class HallManager < ApplicationRecord
  validates :city, presence: true
  validates :budget, presence: true
  validates :guest, presence: true

  belongs_to :vendor
end

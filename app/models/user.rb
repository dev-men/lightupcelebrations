class User < ApplicationRecord
  validates :role, presence: true
  validates :name, presence: true
  validates :cnic, presence: true
  validates :number, presence: true

  validates :cnic, length: { is: 13 }
  validates :number, length: { is: 11 }

  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :hall_managers
   has_many :decorators
   has_many :photographers
   has_many :marquees
   has_many :bookings
end

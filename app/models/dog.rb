class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  has_attachment :photo
end

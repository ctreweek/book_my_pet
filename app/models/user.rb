class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #this is how to rename has_many association
  has_many :owned_dogs, foreign_key: "user_id", class_name: "Dog"

  has_many :bookings
  has_many :booked_dogs, through: :bookings, source: :dog
end

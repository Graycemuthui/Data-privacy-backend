class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_many :appointments, dependent: :destroy
  has_many :reminders, dependent: :destroy
  has_one :facility, class_name: 'Facility'
end

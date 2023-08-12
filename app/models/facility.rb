class Facility < ApplicationRecord
  belongs_to :user
  has_many :appointments, foreign_key: :facility_id, dependent: :destroy
end

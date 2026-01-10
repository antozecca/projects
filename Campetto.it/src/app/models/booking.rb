class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot, optional: true
  has_many :reports, as: :reportable
end

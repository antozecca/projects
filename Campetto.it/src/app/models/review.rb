class Review < ApplicationRecord
  belongs_to :field
  belongs_to :user

  validates :titolo, presence: true
  validates :valutazione, presence: true, inclusion: { in: 1..5 }
  validates :testo,length: { maximum: 500 }, allow_blank: true
  validates :user, presence: true
end


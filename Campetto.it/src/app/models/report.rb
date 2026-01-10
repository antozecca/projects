class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  belongs_to :reporter, polymorphic: true

  # Definisce l'enumerazione per gli stati della segnalazione
  enum status: { pending: 0, accepted: 1, rejected: 2 }

  validates :status, presence: true
  validates :details, presence: true

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :pending
  end
end


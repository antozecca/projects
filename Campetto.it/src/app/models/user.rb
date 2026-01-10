class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reports, as: :reporter, dependent: :destroy

  # Validazioni per l'email
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create, allow_nil: true

  before_create :generate_confirmation_token

  # Genera il token di conferma
  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s if self.confirmation_token.blank?
  end

  # Marca l'utente come confermato
  def confirm!
    self.confirmed_at = Time.current
    self.confirmation_token = nil
    save!
  end

  # Verifica se l'utente è confermato
  def confirmed?
    confirmed_at.present?
  end
  
end
  

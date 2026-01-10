class Field < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :image
  has_many :slots, dependent: :destroy
  belongs_to :sports_center, optional: true

  after_create :create_slots

  # Configurazione della geocodifica
  geocoded_by :full_address, latitude: :latitudine, longitude: :longitudine
  after_validation :geocode, if: :address_changed?

  # Esegui la geocodifica solo se uno dei campi dell'indirizzo è cambiato
  after_validation :geocode_and_handle_errors, if: :address_changed?

  serialize :exclude_days, Array

  private

  def create_slots
    Slot.generate_slots(self)
  end

  # Combina i campi per ottenere l'indirizzo completo
  def full_address
    "#{via}, #{cap} #{citta}, Italia"
  end

  # Controlla se uno dei campi dell'indirizzo è cambiato
  def address_changed?
    via_changed? || citta_changed? || cap_changed?
  end

  def geocode_and_handle_errors
    if geocode
      Rails.logger.info "Geocoding successful: #{self.latitudine}, #{self.longitudine}"
    else
      Rails.logger.error "Geocoding failed for address: #{full_address}"
      errors.add(:base, "L'indirizzo inserito non è valido o il geocoding non è riuscito.")
    end
  end

  # Alias per compatibilità con chi usa latitude/longitude
  def latitude
    latitudine
  end

  def longitude
    longitudine
  end
end

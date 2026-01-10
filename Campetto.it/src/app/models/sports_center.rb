class SportsCenter < ApplicationRecord
    # Associa il proprietario come singolo partner
    belongs_to :owner, class_name: 'Partner', foreign_key: 'owner_id'
     has_many :fields, dependent: :nullify 
    # Relazione many-to-many con Partner per i manager
    has_many :partners_sports_centers, dependent: :destroy
    has_many :managers, through: :partners_sports_centers, source: :partner

    # Validation
    validates :tax_code, presence: true, format: {with: RegexModule::IT_TAXCODE}
    validates :vat_number, presence: true, format: {with: RegexModule::IT_VATNUMBER}
    validates :company_name, presence: true, length: {minimum: 2, maximum: 150}
    validates :iban, presence: true, format: {with: RegexModule::IT_IBAN}
    validates :email, presence: true, format: {with: RegexModule::EMAIL}
    validates :phone, presence: true, format: {with: RegexModule::PHONE_NUMBER}
    validates :registered_office, presence: true, length: {minimum: 5, maximum: 255}
    
    # 
    def owned_by?(partner)
        self.owner == partner
    end

    def managed_by?(partner)
        managers.include?(partner)
    end

end

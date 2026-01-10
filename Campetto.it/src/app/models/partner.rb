class Partner < ApplicationRecord
    attr_accessor   :remember_token, :activation_token, :reset_token
    before_save     :downcase_beforesave
    before_create   :create_activation_digest
    

    # Associazione per i centri posseduti
    has_many :owned_sports_centers, class_name: 'SportsCenter', foreign_key: 'owner_id', dependent: :destroy

    # Associazione many-to-many per i centri gestiti
    has_many :partners_sports_centers
    has_many :managed_sports_centers, through: :partners_sports_centers, source: :sports_center

    # Validazione per assicurare che un Partner non possa possedere e gestire lo stesso centro sportivo
    validate :cannot_own_and_manage_same_sports_center


    MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]{2,}\z/i
    GENDER_REGEX = /\A[mfu]\z/i

    has_secure_password

    validates :name, presence: true, length: { minimum: 2, maximum: 50 }
    validates :surname, presence: true, length: { minimum: 2, maximum: 50 }
    validates :gender, format: { with: GENDER_REGEX, allow_blank: true }
    validates :mobile, presence: true, format: { with: /\A\+?[0-9]{10,15}\z/}
    validates :birthdate, presence: true
    validate :must_be_at_least_18_years_old
    validates :email, presence: true, format: { with: MAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    # Returns the hash digest of the given string
    def Partner.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def Partner.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = Partner.new_token
        update_attribute(:remember_digest, Partner.digest(remember_token))
    end

    # Returns true if the given token matches the digest
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    # Forgets a partner
    def forget
        update_attribute(:remember_digest, nil)
    end

    # Activates an account
    def activate
        update_attribute(:activated, true)
        update_attribute(:activated_at, Time.zone.now)
    end

    def send_activation_email
        PartnerMailer.account_activation(self).deliver_now
    end

    def username
        "#{self.name} #{self.surname}".split.map(&:capitalize).join(' ')
    end

    # Sets the password reset atributes
    def create_reset_digest
        self.reset_token = Partner.new_token
        update_attribute(:reset_digest, Partner.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    # Sends password reset email
    def send_password_reset_email
        PartnerMailer.password_reset(self).deliver_now 
    end

    # Returns true if a password reset has expired
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end

    private
        def must_be_at_least_18_years_old
            if birthdate.present? && birthdate > 18.years.ago
                errors.add(:birthdate, 'devi avere almeno 18 anni.')
            end
        end

        def downcase_beforesave
            self.name = name.downcase
            self.surname = surname.downcase
            self.email = email.downcase    
        end

        def create_activation_digest
            self.activation_token = Partner.new_token
            self.activation_digest = Partner.digest(activation_token)
        end
        
        def cannot_own_and_manage_same_sports_center
            return if managed_sports_centers.nil? || owned_sports_centers.nil?
            managed_sports_centers.each do |center|
                if owned_sports_centers.include?(center)
                    errors.add(:base, "A partner cannot simultaneously own and manage the same sports center.")
                end
            end
        end
        
end

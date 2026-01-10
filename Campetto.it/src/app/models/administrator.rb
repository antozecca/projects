class Administrator < ApplicationRecord
    attr_accessor :remember_token
    
    #before_save method to downcase name, surname and email
    before_save{
        self.name = name.downcase
        self.surname = surname.downcase
        self.email = email.downcase
    }

    #Password declaration
    has_secure_password

    #Regex, to refactoring into a common module for application
    MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]{2,}\z/i

    #Attribute validation
    validates :name, presence: true, length: { minimum:2, maximum:50}
    validates :surname, presence: true, length: { minimum:2, maximum:50}
    validates :email, presence: true, length: { maximum: 255 }, format: { with: MAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 6}, allow_blank: true

    # Returns the hash digest of the given string
    def Administrator.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token
    def Administrator.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers an administrator in the database for use in persistent sessions
    def remember
        self.remember_token = Administrator.new_token
        update_attribute(:remember_digest, Administrator.digest(remember_token))
    end

    # Returns true if the given token matches the digest
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets an administrator
    def forget
        update_attribute(:remember_digest, nil)
    end
end


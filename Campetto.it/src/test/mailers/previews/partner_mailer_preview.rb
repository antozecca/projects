# Preview all emails at http://localhost:3000/rails/mailers/partner_mailer
class PartnerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/partner_mailer/account_activation
  def account_activation
    PartnerMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/partner_mailer/password_reset
  def password_reset
    PartnerMailer.password_reset
  end

end

class UserMailer < ApplicationMailer
    default from: 'campetto.it@gmail.com'
  
    def registration_confirmation(user)
      @user = user
      @url = confirm_user_url(user.confirmation_token)
      mail(to: @user.email, subject: 'Conferma la tua registrazione')
    end

    def password_reset
      @user = params[:user]
      @reset_link = edit_password_url(token: params[:token], host: 'localhost:3000')
      mail(to: @user.email, subject: 'Reset della tua password')
    end

    def booking_success_email(user, booking)
      @user = user
      @booking = booking
      @slot = @booking.slot
      @field = @slot.field
  
      mail(to: @user.email, subject: 'Prenotazione Avvenuta con Successo')
    end
    
    def notification
      @report = params[:report]
      @reporter = @report.reporter
      mail(to: @reporter.email, subject: 'Aggiornamento sulla tua segnalazione')
    end
  end
  

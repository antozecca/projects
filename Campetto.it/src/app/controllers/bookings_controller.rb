class BookingsController < ApplicationController
    before_action :require_user
  
    # Visualizza tutte le prenotazioni dell'utente
    def index
      @bookings = current_user.bookings.includes(:slot)
    end
  

    def destroy
        @booking = Booking.find(params[:id])
        
        if @booking.user == current_user
          if @booking.slot.start_time > 24.hours.from_now
            
            refund_stripe(@booking) 

            @booking.destroy
            @booking.slot.update(booked: false)
            flash[:notice] = "Prenotazione annullata con successo. Ti è stato rimborsato l'importo."
          else
   
            @booking.destroy
            @booking.slot.update(booked: false)
            flash[:notice] = "Prenotazione annullata con successo, ma non è previsto alcun rimborso."
          end
        else
          flash[:alert] = "Non hai il permesso di annullare questa prenotazione."
        end
        
        redirect_to bookings_path
    end
      
    private
      
    def refund_stripe(booking)
        begin
          Stripe::Refund.create({
            payment_intent: booking.payment_intent_id 
          })
        rescue Stripe::StripeError => e
          flash[:alert] = "Errore nel rimborso: #{e.message}"
        end
    end
      
    def require_user
      unless current_user
        flash[:alert] = "Devi essere loggato per visualizzare le tue prenotazioni."
        redirect_to logReg_path(form: 'login')
      end
    end
  end
  
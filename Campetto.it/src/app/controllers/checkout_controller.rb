class CheckoutController < ApplicationController
  before_action :require_user

  def create
    @slot = Slot.find(params[:slot_id])
  
    # Impedisci di creare una prenotazione per uno slot già prenotato
    if @slot.booked
      flash[:alert] = "Questo slot è già stato prenotato."
      redirect_to field_path(@slot.field) and return
    end
  
    # Crea un payment intent e ottieni l'ID
    payment_intent = Stripe::PaymentIntent.create({
      amount: (@slot.field.prezzo * 100).to_i, 
      currency: 'eur',
      automatic_payment_methods: {
        enabled: true,
        allow_redirects: 'never' 
      }
    })
  
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: "Prenotazione campo: #{@slot.field.nome} - #{@slot.start_time.strftime('%d/%m/%Y %H:%M')} - #{@slot.end_time.strftime('%H:%M')}",
          },
          unit_amount: (@slot.field.prezzo * 100).to_i,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: checkout_success_url(slot_id: @slot.id, payment_intent_id: payment_intent.id),
      cancel_url: checkout_cancel_url(slot_id: @slot.id),
    )
  
    redirect_to session.url, allow_other_host: true
  
  end
  
  
  def success
    @slot = Slot.find(params[:slot_id])
    
    # Controlla se il payment_intent_id è presente
    if params[:payment_intent_id].nil?
      flash[:alert] = "Impossibile completare la prenotazione. ID del pagamento mancante."
      redirect_to field_path(@slot.field) and return
    end

    @slot.update(booked: true)
    booking = Booking.create!(
      user: current_user,
      slot: @slot,
      payment_intent_id: params[:payment_intent_id]
    )

    @field = @slot.field
    UserMailer.booking_success_email(current_user, booking).deliver_now
    render 'success'
  end
  
  def cancel
    if params[:slot_id]
      @slot = Slot.find_by(id: params[:slot_id])
      if @slot
        @field = @slot.field
      else
        @field = nil
      end
    else
      @field = nil
    end

    unless @field
      flash[:alert] = "Informazioni sul campo non disponibili."
      redirect_to root_path and return
    end
  end



  private

  def require_user
    unless current_user
      flash[:alert] = "Devi essere loggato per prenotare un campo."
      redirect_to logReg_path(form: 'login')
    end
  end
end


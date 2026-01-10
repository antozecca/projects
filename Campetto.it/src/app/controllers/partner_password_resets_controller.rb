class PartnerPasswordResetsController < ApplicationController
  before_action :get_partner,         only: [:edit, :update]
  before_action :valid_partner,       only: [:edit, :update]
  before_action :check_expiration,    only: [:edit, :update]

  def new
  end

  def create
    @partner = Partner.find_by(email: params[:password_reset][:email].downcase)
    if @partner
      @partner.create_reset_digest
      @partner.send_password_reset_email
      flash[:info] = "Ti abbiamo inviato una mail con le istruzioni per il ripristino della password!"
      redirect_to root_url
    else
      flash.now[:danger] = "Indirizzo email non trovato"
      render 'new'
    end
  end

  def edit
  end

  def update
    if password_blank?
      flash.now[:danger] = "La password non può essere vuota"
      render 'edit'
    elsif @partner.update(partner_params)
      log_in_partner @partner
      flash[:success] = "La password è stata reimpostata"
      redirect_to partner_dashboard_path
    else
      render 'edit'
    end
  end

  private
    
    def partner_params
      params.require(:partner).permit(:password, :password_confirmation)
    end

    def password_blank?
      params[:partner][:password].blank?
    end

    def get_partner
      @partner = Partner.find_by(email: params[:email])
    end

    # Confirm a valid partner
    def valid_partner
      unless (@partner && @partner.activated? && @partner.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    def check_expiration
      if @partner.password_reset_expired?
        flash[:danger] = "Il link di reset della password è scaduto"
        redirect_to new_partner_password_reset_url
      end
    end

end

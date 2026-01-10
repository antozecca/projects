class PartnersController < ApplicationController
  layout 'dashboard', only: [:dashboard]
  before_action :logged_in_partner, only: [:dashboard]

  #OK
  def new
    @partner = Partner.new
  end

  #OK
  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      @partner.send_activation_email
      flash[:info] = "Controlla la tua email per attivare il tuo account."
      redirect_to root_url
    else
        render 'new'
    end
  end


  def dashboard
    @partner = Partner.find(session[:partner_id])
    @fields = Field.joins(:sports_center).where(sports_centers: { owner_id: @partner.id })
    field_ids = @fields.pluck(:id)

    # Filtra le prenotazioni usando gli ID dei campi
    @bookings = Booking.joins(:slot).where(slots: { field_id: field_ids })
  end

  #Pagina per renderizzare il mio profilo
  def edit

  end

  # Pagina per modificare il mio profilo
  def update
  
  end




  #Pagina per mostrare tutti i partner
  def index
    partners = Partner.all
    render json: partners, status: :ok
  end

  #def myprofile
  #  @partner = Partner.find(session[:partner_id])
  #end

  #def myprofile_update

  #end
  
  #def edit
  #  render partial: '_edit', layout: false
  #end

  #def update

  #end

  def destroy
    partner = Partner.find(params[:id])
    if partner.destroy
      render json: {message: "Partner eliminato con successo."}, status: :ok
    else 
      render json: {message: "Errore durante l'eliminazione dell'amministratore."}, status: :unprocessable_entity
    end
  end

  private
    
    def partner_params
      params.require(:partner).permit(:name, :surname, :gender, :mobile, :birthdate, :email, :password, :password_confirmation)
    end

    def logged_in_partner
      unless logged_in_partner?
        store_location
        flash[:danger] = "Non sei autorizzato ad accedere a questa pagina"
        redirect_to partner_log_in_url
      end
    end
end

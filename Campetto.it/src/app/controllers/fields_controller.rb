class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_partner!, only: [:new, :create]

  # Lista di tutti i campi
  def index
    @fields = Field.all
  end

  # Form per creare un nuovo campo
  def new
    @field = Field.new
  end

 def create
  sports_center_id = params[:field][:sports_center_id]
  partner_id = session[:partner_id]

  # Verifica che il Centro Sportivo appartenga al partner autenticato
  if SportsCenter.exists?(id: sports_center_id, owner_id: partner_id)
    # Logica per creare l'oggetto o completare l'azione
    @field = Field.new(field_params)

    if @field.save
      redirect_to partner_dashboard_path, notice: 'Campo creato con successo.'
    else
      render :new
    end
  else
    flash[:alert] = "ID del Centro Sportivo non valido o non appartiene al partner corrente."
    redirect_to new_field_path
  end

end


  # Form per modificare un campo esistente
  def edit
  end

  # Aggiorna un campo esistente
  def update
    if @field.update(field_params)
      redirect_to @field, notice: "Campo sportivo aggiornato con successo."
    else
      render :edit
    end
  end

  # Elimina un campo
  def destroy
    @field.destroy
    redirect_to fields_path, notice: "Campo sportivo eliminato con successo."
  end

def search
  indirizzo = params[:indirizzo]
  sport = params[:sport]
  data = params[:data]
  raggio = 30 # Raggio di ricerca di default in km
  

  # Controllo della presenza dell'indirizzo o delle coordinate
  if indirizzo.blank? && params[:latitudine].blank? && params[:longitudine].blank?
    flash[:alert] = "Inserisci un indirizzo o utilizza la tua posizione per effettuare la ricerca."
    @fields = Field.none
    render 'search' and return
  end

  # Ottenere le coordinate
  if params[:latitudine].present? && params[:longitudine].present?
    lat = params[:latitudine].to_f
    lon = params[:longitudine].to_f
  else
    results = Geocoder.search(indirizzo)
    if results.any?
      coordinates = results.first.coordinates
      lat = coordinates[0]
      lon = coordinates[1]
    else
      flash[:alert] = "Indirizzo non valido. Per favore riprova."
      @fields = Field.none
      render 'search' and return
    end
  end
  

  # Filtro per sport se selezionato
  @fields = Field.all
  @fields = @fields.where(sport: sport) unless sport == "Tutti"

  # Ricerca dei campi vicini e ordinamento per distanza
  @fields = @fields.near([lat, lon], raggio, order: :distance)

  # Data selezionata
  @selected_date = data.present? ? Date.parse(data) : Date.today

  # Memorizzare i parametri per ripopolare il form
  @selected_indirizzo = indirizzo
  @selected_sport = sport
  @selected_date = @selected_date

  render 'search'
end



 def show
  @field = Field.find(params[:id])
  
  
  # Controlla se il parametro :date è presente e valido, altrimenti usa la data odierna
  begin
    @selected_date = params[:date].present? ? Date.parse(params[:date]) : Date.today
  rescue ArgumentError
    # In caso di formato data non valido, imposta la data odierna
    flash[:alert] = "Data non valida, impostata la data odierna."
    @selected_date = Date.today
  end

  if @selected_date < Date.today
    @selected_date = Date.today
  end

  # Carica gli slot disponibili per la data selezionata
  @slots = @field.slots.where('DATE(start_time) = ?', @selected_date)
                       .where(booked: false)
                       .order(:start_time)
end

  # Funzione per il reverse geocoding
 def reverse_geocode
  lat = params[:lat].to_f
  lon = params[:lon].to_f
  results = Geocoder.search([lat, lon])

  if results.any?
    render json: { address: results.first.address }
  else
    render json: { error: 'Indirizzo non trovato' }, status: 404
  end
end
  private

  # Trova il campo in base all'id
  def set_field
    @field = Field.find(params[:id])
  end

  # Parametri permessi
  def field_params
  params.require(:field).permit(:sports_center_id, :nome, :descrizione, :sport, :prezzo, :image, :via, :citta, :cap, :start_time, :end_time, :interval, exclude_days: [])
end

end


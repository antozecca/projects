class AdministratorsController < ApplicationController
  layout false,                             only: [:new, :create, :index, :destroy]
  layout 'dashboard',                       only: [:dashboard]
  before_action :logged_in_administrator,   only: [:new, :create, :edit, :update, :dashboard, :index, :destroy]
  before_action :root_administrator,        only: [:new, :create, :index, :edit_per_root, :update_per_root, :destroy]
  
  # Ok C-
  def new
    @administrator = Administrator.new
    render partial: 'new'
  end  
  
  # Ok C-
  def create
    administrator = Administrator.new(administrator_params)
    if administrator.save
      render json: {message: "Amministratore creato con successo."}, status: :ok
    else
      render json: { message: "Errore durante la creazione dell'amministratore." }, status: :unprocessable_entity
    end
  end
  
  # Ok C-
  def edit
    if request.path == administrator_profile_path
      @administrator = Administrator.find(session[:administrator_id])
      render 'edit'
      return
    else
      render partial: '_edit', layout: false
      return
    end
  end

  #C -
  def update
    if request.path == administrator_profile_update_path
      @administrator.update_attributes(administrator_update_params)
      redirect_to administrator_profile_path
    elsif current_administrator.root?
      @administrator = Administrator.find(params[:id]);
      if @administrator.update_attributes(administrator_update_params)
        render json: {message: "Amministratore aggiornato con successo."}, status: :ok
      else
        render json: {message: "Errore durante l'aggiornamento dell'amministratore."}, status: :unprocessable_entity
      end
    end
  end

  # C
  def dashboard
    @administrator = Administrator.find(session[:administrator_id])
    @reviews = Review.all.order(created_at: :desc)
    @reports = Report.all
    @users = User.all
    @fields = Field.order(:sports_center_id, :created_at)
    @bookings = Booking.all
  end
  
  # C
  def index
    administrators = Administrator.all
    render json: administrators, status: :ok
  end

  # C
  def destroy
    administrator = Administrator.find(params[:id])
    if administrator.destroy
      render json: {message: "Amministratore eliminato con successo."}, status: :ok
    else
      render json: {message: "Errore durante l'eliminazione dell'amministratore."}, status: :unprocessable_entity
    end
  end

  private
    def administrator_params
      params.require(:administrator).permit(:name, :surname, :email, :password, :password_confirmation, :root)
    end

    def administrator_update_params
      if request.path == administrator_profile_update_path
        params.require(:administrator).permit(:password, :password_confimartion, :password_old)
      else
        params.require(:administrator).permit(:name, :surname, :email, :password, :password_confirmation)
      end
    end

    # Confirms a logged-in administrator
    def logged_in_administrator
      unless logged_in_administrator?
        store_location
        flash[:danger] = 'Non sei autorizzato ad accedere a questa pagina, autenticati!'
        redirect_to administrator_log_in_url
      end
    end

    # Confirms a root , forse in questo caso è meglio reindirizzare a 403 Forbidden?
    def root_administrator
      render json: {message: 'Non autorizzato!'}, status: :forbidden unless current_administrator.root?
    end

end

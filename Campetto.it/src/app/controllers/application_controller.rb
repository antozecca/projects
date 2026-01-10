class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  protect_from_forgery with: :exception

  include SessionsHelper

  def current_user
    # Carica l'utente in sessione solo se session[:user_id] è presente
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]

    @current_user
  end

  def logged_in?
    # Restituisce true se current_user è presente, altrimenti false
    !!current_user
  end

  def authenticate_user!
    # Reindirizza a logReg_path se l'utente non è loggato
    unless logged_in?
      redirect_to logReg_path, alert: "Devi accedere per visualizzare questa pagina."
    end
    end
    
     def authenticate_partner!
    unless logged_in_partner?
      store_location
      flash[:danger] = "Devi essere loggato come partner per accedere a questa pagina."
      redirect_to partner_log_in_url
    end

  end
end

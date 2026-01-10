class SessionsController < ApplicationController

  def new
    @current_route = request.path 
    # Administrator
    if @current_route == administrator_log_in_path
      render 'administrator_new'
      return
    end
    # Partner
    if @current_route == partner_log_in_path
      render 'partner_new'
      return
    end
  end
  
  def create
    @current_route = request.path
    # Administrator
    if @current_route == administrator_log_in_path
      administrator = Administrator.find_by(email: params[:session][:email].downcase)
      if administrator && administrator.authenticate(params[:session][:password])
        log_in_administrator administrator
        params[:session][:remember_me] == '1' ? remember_administrator(administrator) : forget_administrator(administrator)
        redirect_back_or administrator_dashboard_path
        return
      else
        flash.now[:danger] = 'Email o password errate'
        render 'administrator_new'
        return
      end
    end
    if @current_route == partner_log_in_path
      partner = Partner.find_by(email: params[:session][:email].downcase)
      if partner && partner.authenticate(params[:session][:password])
        if partner.activated?
          log_in_partner partner
          params[:session][:remember_me] == '1' ? remember_partner(partner) : forget_partner(partner)
          redirect_back_or partner_dashboard_path
          return
        else
          message = "Account non attivato! "
          message += "Controlla la tua mail per il link di attivazione."
          flash[:warning] = message
          redirect_to root_url
          return
        end
      else
        flash.now[:danger] = 'Email o password errate'
        render 'partner_new'
        return
      end
    end

    user = User.find_by(email: session_params[:email_login])
  
    if user&.authenticate(session_params[:password_login])
      if user.confirmed_at?
        session[:user_id] = user.id 
        flash[:notice] = "Accesso effettuato con successo."
        redirect_to accountUtente_path
      else
        flash[:alert] = "Devi confermare il tuo account prima di accedere."
        redirect_to logReg_path(form: 'login')
      end
    else
      flash[:alert] = "Email o password errati."
      redirect_to logReg_path(form: 'login')
    end    
  end
  
  def welcome
    @user = User.find(session[:user_id])
  end

  def destroy
    @current_route = request.path
    # Administrator
    if @current_route == administrator_log_out_path
      log_out_administrator if logged_in_administrator?
      redirect_to root_url
      return
    end
    # Partner
    if @current_route == partner_log_out_path
      log_out_partner if logged_in_partner?
      redirect_to root_url
      return
    end
    

    session[:user_id] = nil 
    redirect_to root_path
  end

  def omniauth
    @user = User.find_or_create_by(uid: request.env['omniauth.auth']['uid'], provider: request.env['omniauth.auth']['provider']) do |u|
        u.email = request.env['omniauth.auth']['info']['email']
        u.password = SecureRandom.hex(10)
    end
    if @user.valid?
        session[:user_id] = @user.id
        redirect_to accountUtente_path
    else
        render :new
    end
  end

  private
  def session_params
    params.require(:session).permit(:email_login, :password_login)
  end
end
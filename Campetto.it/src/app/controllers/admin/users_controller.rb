# app/controllers/admin/users_controller.rb
module Admin
  class UsersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_user, only: [:edit, :update, :destroy]

    def index
      @users = User.all
      respond_to do |format|
        format.html
        format.js
      end
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: 'Utente creato con successo.'
      else
        @users = User.all
        render :index
      end
    end

    def edit
      respond_to do |format|
        format.js
      end
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'Utente aggiornato con successo.'
      else
        @users = User.all
        render :index
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'Utente eliminato con successo.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # Assicurati di permettere solo i parametri necessari
      params.require(:user).permit(:email, :password, :role)
    end

    def authenticate_admin!
      # Implementa l'autenticazione dell'amministratore
      unless current_user&.admin?
        redirect_to root_path, alert: 'Accesso non autorizzato.'
      end
    end
  end
end


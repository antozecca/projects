# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :set_field, only: [:field_reviews, :new, :create]
  before_action :require_user, except: [:field_reviews, :index, :show, :partner_reviews]
  before_action :set_review, only: [:destroy]
 before_action :authorize_user, only: [:destroy]
before_action :admin_only,     only: [:destroy]
  before_action :authenticate_partner!, only: [:partner_reviews]

  # Recensioni per i campi del partner
  def partner_reviews
  @partner = (defined?(current_partner) && current_partner) || Partner.find_by(id: session[:partner_id])
  unless @partner
    redirect_to partner_log_in_path, alert: "Devi accedere come partner." and return
  end

  sports_center_ids = @partner.owned_sports_centers.pluck(:id)
  @reviews = Review.joins(:field).where(fields: { sports_center_id: sports_center_ids }).order(created_at: :desc)

  flash.now[:info] = "Non ci sono recensioni disponibili per i tuoi campi sportivi." if @reviews.empty?

  respond_to do |format|
    format.html { render partial: 'partners/reviews' }
    format.json { render json: @reviews }
  end
end

  # Visualizza tutte le recensioni per un campo specifico
  def field_reviews
    @field = Field.find(params[:field_id])
    @reviews = @field.reviews.order(created_at: :desc)
  end

  # Visualizza tutte le recensioni dell'utente corrente
  def user_index
    @reviews = Review.where(user: current_user).includes(:field).order(created_at: :desc)
  end

  def new
    @review = @field.reviews.build
  end

  def create
    @review = @field.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:success] = "Recensione aggiunta con successo."
      redirect_to field_reviews_path(@field)
    else
      render 'new'
    end
  end

  def destroy
    if @review.destroy
      redirect_back(fallback_location: administrator_dashboard_path, notice: 'Recensione eliminata con successo.')
    else
      redirect_back(fallback_location: administrator_dashboard_path, alert: 'Impossibile eliminare la recensione.')
    end
  end

  private

  def set_field
    @field = Field.find(params[:field_id]) if params[:field_id]
  end

  def set_review
    @review = Review.find(params[:id])
  end

def authorize_user
  is_owner = current_user && @review && @review.user_id == current_user.id
  is_admin = (defined?(current_administrator) && current_administrator.present?) ||
             (current_user && current_user.respond_to?(:admin?) && current_user.admin?)
  unless is_owner || is_admin
    redirect_to root_path, alert: "Non sei autorizzato a eliminare questa recensione."
  end
end

  def review_params
    params.require(:review).permit(:titolo, :valutazione, :testo)
  end

  def require_user
    redirect_to login_path, alert: "Devi essere loggato per eseguire questa azione." unless current_user
  end

  def admin_only
  if defined?(@review) && @review && current_user && @review.user_id == current_user.id
    return
  end

   is_admin =
    (defined?(current_administrator) && current_administrator.present?) ||          
    (current_user && current_user.respond_to?(:admin?) && current_user.admin?)  
  redirect_to root_path, alert: "Accesso non autorizzato." unless is_admin
end
end


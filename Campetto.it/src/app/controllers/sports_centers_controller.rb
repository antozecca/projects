class SportsCentersController < ApplicationController
    before_action :logged_in_partner, only: [:new, :create, :index]
    #before_action :logged_in_administrator,

    # Partner method
    def new
        @sports_center = SportsCenter.new
        render partial: 'new', layout: false
    end
    
    def create
        @sports_center = SportsCenter.new(sports_center_params)
        @sports_center.owner_id  = current_partner_id
        if @sports_center.save
            redirect_to partner_dashboard_path
        else
            puts @sports_center.errors.full_messages
            #Redirect ad error!
            render json: { message: "Error!" }, status: :unprocessable_entity
        end
    end

    # Send JSON with all accessible sports center from the partner
    def index
        partner_id = current_partner_id
        owned_centers = SportsCenter.where(owner_id: partner_id)
        managed_centers = SportsCenter.joins(:managers).where(partners_sports_centers: {partner_id: partner_id})
        accessible_centers = (owned_centers + managed_centers).uniq
        render json: accessible_centers, status: :ok
    end

    def edit
        @sports_center = SportsCenter.find(params[:id]);
        if @sports_center.owned_by?(current_partner)
            render partial: 'edit', layout: false
        else
            #Redirect aunhatorized
            render json: {message: "Accesso negato"}, status: :unprocessable_entity
        end
    end

    def update
        @sports_center = SportsCenter.find(params[:sports_center][:id]);
        if @sports_center.update(sports_center_params)
            render json: {}, status: :ok;
        else
            render json: {}, status: :unprocessable_entity
        end
    end

    def destroy
        sports_center = SportsCenter.find(params[:id])
        if sports_center
            sports_center.managers.clear
            sports_center.destroy
        end
        redirect_to partner_dashboard_path
    end

    # Delegated management
    def delegate_new
        render partial: 'new_delegate', layout: false
    end

    #Accessibile solo dal partner proprietario
    def delegate_create
        sports_center = SportsCenter.find(params[:sport_center_id])
        partner = Partner.find_by(email: params[:email])
        if sports_center && partner
            sports_center.managers << partner unless sports_center.managers.include?(partner)
            render json: {}, status: :ok
        else
            render json: {}, status: :unprocessable_entity
        end
    end

    def delegate_index
        sports_center = SportsCenter.find(params[:id])
        delegates = sports_center.managers
        
        delegate_info = delegates.map do |delegate|
            {
                id: delegate.id,
                name: delegate.name,
                surname: delegate.surname,
                email: delegate.email
            }
        end
        render json: delegate_info, status: :ok
    end

    def delegate_remove
        sports_center = SportsCenter.find(params[:sport_center_id])
        partner = Partner.find_by(email: params[:email])
        if sports_center && partner && sports_center.managers.include?(partner)
                sports_center.managers.delete(partner)
                render json: {}, status: :ok
        else
            render json: {}, status: :unprocessable_entity
        end
    end

    # Funzioni per amministratore
    # Modifica, elimina

    #3 livelli di autorizzazione: proprietario, 

    private
        def sports_center_params
            params.require(:sports_center).permit(:tax_code, :vat_number, :iban, :email, :phone, :company_name, :registered_office)
        end

        def sports_center_update_params
            params.require(:sports_center).permit(:iban, :email, :phone, :registered_office);
        end
        
        def logged_in_partner
            unless logged_in_partner?
              store_location
              flash[:danger] = "Non sei autorizzato ad accedere a questa pagina"
              redirect_to partner_log_in_url
            end
        end


        def current_partner_id
            current_partner.id
        end
      
end

class PartnerActivationsController < ApplicationController

    def edit
        partner = Partner.find_by(email: params[:email])
        if partner && !partner.activated? && partner.authenticated?(:activation, params[:id])
            partner.activate
            log_in_partner partner
            flash[:success] = "Account attivato!"
            redirect_to partner_dashboard_url
        else
            flash[:danger] = "Invalid activation link"
            redirect_to root_url
        end
    end
    
end

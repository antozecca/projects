module SessionsHelper

    # Logs in the given administrator
    def log_in_administrator(administrator)
        session[:administrator_id] = administrator.id
    end

    #Logs in the giver partner
    def log_in_partner(partner)
        session[:partner_id] = partner.id
    end

    # Remembers an administrator in a persistent session
    def remember_administrator(administrator)
        administrator.remember
        cookies.permanent.signed[:administrator_id] = administrator.id
        cookies.permanent[:administrator_remember_token] = administrator.remember_token
    end

    # Remembers a partner in a persistent session
    def remember_partner(partner)
        partner.remember
        cookies.permanent.signed[:partner_id] = partner.id
        cookies.permanent.signed[:partner_remember_token] = partner.remember_token
    end

    # Returns true if the given administrator is the current admnistrator
    def current_administrator?(administrator)
        administrator == current_administrator
    end

        # Returns true if the given administrator is the current admnistrator
    def current_administrator?(partner)
        administrator == current_partner
    end
    

    # Returns the current logged-in administrator (if any)
    def current_administrator
        if (administrator_id = session[:administrator_id])
            @current_administrator ||= Administrator.find_by(id: administrator_id)
        elsif (administrator_id = cookies.signed[:administrator_id])
            administrator = Administrator.find_by(id: administrator_id)
            if administrator && administrator.authenticated?(cookies[:administrator_remember_token])
                log_in_administrator administrator
                @current_administrator = administrator
            end
        end
    end
    
    # Returns the current logged-in partner (if any)
    def current_partner
        if (partner_id = session[:partner_id])
            @current_partner ||= Partner.find_by(id: partner_id)
        elsif (partner_id = cookies.signed[:partner_id])
            partner = Partner.find_by(id: partner_id)
            if partner && partner.authenticated?(:remember, cookies[:partner_remember_token])
                log_in_partner partner
                @current_partner = partner
            end
        end
    end

    # Returns true if the administrator is logged in, false otherwise
    def logged_in_administrator?
        !current_administrator.nil?
    end

    # Returns true if the partner is logged in, false otherwise
    def logged_in_partner?
        !current_partner.nil?
    end


    # Forgets a persistent session
    def forget_administrator(administrator)
        administrator.forget
        cookies.delete(:administrator_id)
        cookies.delete(:administrator_remember_token)
    end

    # Forgets a persistent session
    def forget_partner(partner)
        partner.forget
        cookies.delete(:partner_id)
        cookies.delete(:partner_remember_token)
    end

    # Logs out the current administrator
    def log_out_administrator
        forget_administrator(current_administrator)
        session.delete(:administrator_id)
        @current_administrator = nil
    end

    #Logs out the current partner
    def log_out_partner
        forget_partner(current_partner)
        session.delete(:partner_id)
        @current_partner = nil
    end

    # Redirects to stored location (or to the default)
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    # Stores the URL trying to be accessed
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end

end

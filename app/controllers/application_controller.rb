class ApplicationController < ActionController::Base
    helper_method :current_tenant, :logged_in?

    def current_tenant
        if session[:tenant_id]
            Tenant.find(session[:tenant_id])
        end 
    end 

    def logged_in? 
        !!current_tenant
    end 

    def authorized?
        current_tenant.id == params[:id].to_i
    end 

end

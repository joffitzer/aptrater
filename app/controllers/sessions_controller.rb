class SessionsController < ApplicationController

    def new
    end 

    def create 
        tenant = Tenant.find_by(username: params[:username])
        
        if tenant && tenant.authenticate(params[:password])
            session[:tenant_id] = tenant.id  
            redirect_to home_path
        else 
            flash[:errors] = "Account Not Found. Please enter a valid username and password."
            redirect_to login_path
        end 
    end 

    def destroy 
        session.delete(:tenant_id)
        redirect_to :root 
    end 

end 
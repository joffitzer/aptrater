class TenantsController < ApplicationController
    def index 
        @tenants = Tenant.all
    end 

    def new 
        @tenant = Tenant.new
    end 

    def create 
        tenant = Tenant.new(tenant_params)
        if tenant.save 
            redirect_to tenant_path(tenant)
        else 
            flash[:errors] = tenant.errors.full_messages
            redirect_to new_tenant_path
        end
    end 

    def show 
        @tenant = Tenant.find(params[:id])
        @building_reviews = BuildingReview.all.select do |building_review|
            building_review.tenant == @tenant 
        end 
        @buildings = @building_reviews.map do |review|
            review.building
        end 
    end 

    def edit 
        @tenant = Tenant.find(params[:id])
    end 

    def update 
        tenant = Tenant.find(params[:id])
        if tenant.update(tenant_params)
            redirect_to tenant_path(tenant)
        else 
            flash[:errors] = tenant.errors.full_messages
            redirect_to edit_tenant_path(tenant)
        end 
    end 

    def delete
        tenant = Tenant.find(params[:id])
        tenant.destroy
        redirect_to tenants_path
    end 


    private 

    def tenant_params
        params.require(:tenant).permit(:name, :username)
    end 

end
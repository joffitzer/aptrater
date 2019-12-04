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
            flash[:new_account_message] = "Thanks for creating a new profile! Please log in below:"
            redirect_to login_path
        else 
            flash[:errors] = tenant.errors.full_messages
            redirect_to signup_path
        end
    end 

    def show 
        if logged_in? 
            if authorized?

                @tenant = Tenant.find(params[:id])

                @building_reviews = BuildingReview.all.select do |building_review|
                    building_review.tenant == @tenant 
                end 

                @landlord_reviews = LandlordReview.all.select do |landlord_review|
                    landlord_review.tenant == @tenant 
                end 

                @buildings = @building_reviews.map do |review|
                    review.building
                end 

                @avg_cleanliness = cleanliness_avg

                @avg_super = super_avg

                @avg_noise = noise_avg

                @overall_avg = overall_avg

                render :show
            else 
                @tenant = Tenant.find(params[:id])

                @building_reviews = BuildingReview.all.select do |building_review|
                    building_review.tenant == @tenant 
                end 

                @landlord_reviews = LandlordReview.all.select do |landlord_review|
                    landlord_review.tenant == @tenant 
                end 

                @buildings = @building_reviews.map do |review|
                    review.building
                end 

                @avg_cleanliness = cleanliness_avg

                @avg_super = super_avg

                @avg_noise = noise_avg

                @overall_avg = overall_avg

                render :outside_show
            end 
        else 
            flash[:must_log_in] = "Please create an account or log in:"
            redirect_to :root 
        end 
    end 

    def edit 
        if authorized?
            @tenant = current_tenant
        else 
            flash[:message] = "You do not have access to edit another Tenant's profile."
            redirect_to tenant_path(Tenant.find(params))
        end 
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
        params.require(:tenant).permit(:name, :username, :password, :password_confirmation)
    end 

    def cleanliness_avg
        cleanliness_scores = @building_reviews.map do |review|
            review.cleanliness
        end 
        @avg_cleanliness = cleanliness_scores.sum.to_f / cleanliness_scores.count
    end 

    def super_avg
        super_scores = @building_reviews.map do |review|
            review.super
        end 
        @avg_super = super_scores.sum.to_f / super_scores.count
    end 

    def noise_avg
        noise_scores = @building_reviews.map do |review|
            review.noise
        end 
        @avg_noise = noise_scores.sum.to_f / noise_scores.count
    end 

    def overall_avg
        @overall_avg = (@avg_cleanliness + @avg_noise + @avg_super) / 3
    end 

end
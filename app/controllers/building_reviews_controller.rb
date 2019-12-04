class BuildingReviewsController < ApplicationController
    def index 
        @building_reviews= BuildingReview.all
    end 

    def new 
        @tenant = current_tenant
        @building_review = @tenant.building_reviews.build
    end 

    def create 
        building_review = BuildingReview.new(building_review_params)
        if building_review.save 
            redirect_to building_review_path(building_review)
        else 
            flash[:errors] = building_review.errors.full_messages
            redirect_to new_building_review_path
        end 
    end 

    def show 
        @building_review = BuildingReview.find(params[:id])
        @building = @building_review.building
        @tenant = @building_review.tenant
        @overall_rating = (@building_review.cleanliness.to_f + @building_review.noise.to_f + @building_review.super.to_f) / 3
    end 

    def edit 
        @building_review = BuildingReview.find(params[:id])
    end 

    def update 
        building_review = BuildingReview.find(params[:id])
        building_review.update(building_review_params)
        redirect_to building_review_path(building_review)
    end 

    def delete
        building_review = BuildingReview.find(params[:id])
        building_review.destroy
        redirect_to building_reviews_path
    end 

    #custom routes

    def new_specific_review
        @building = Building.find(params[:building_id])
        @tenant = current_tenant
        @building_review = @tenant.building_reviews.build
        @building_review.building = @building
    end 

    def create_specific_review
        specific_building_review = BuildingReview.new(building_review_params)

            if specific_building_review.save 
                redirect_to building_review_path(specific_building_review)
            else 
                flash[:errors] = building_review.errors.full_messages
                redirect_to new_specific_building_review_path
            end 
        end 


    private 

    def building_review_params
        params.require(:building_review).permit(:title, :content, :cleanliness, :super, :noise, :building_id, :tenant_id, :renew)
    end 

end
class BuildingReviewsController < ApplicationController
    def index 
        @building_reviews= BuildingReview.all
    end 

    def new 
        #@building = Building.find(params[:id])
        @building_review = BuildingReview.new
    end 

    def create 
        building_review = BuildingReview.create(building_review_params)
        redirect_to building_review_path(building_review)
    end 

    def show 
        @building_review = BuildingReview.find(params[:id])
        @building = @building_review.building
        @tenant = @building_review.tenant
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


    private 

    def building_review_params
        params.require(:building_review).permit(:title, :content, :cleanliness, :super, :noise, :building_id, :tenant_id, :renew)
    end 

end
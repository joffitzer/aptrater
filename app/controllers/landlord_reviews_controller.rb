class LandlordReviewsController < ApplicationController
    def index 
        @landlord_reviews = LandlordReview.all
    end 

    def new 
        @tenant = current_tenant
        @landlord_review = @tenant.landlord_reviews.build
    end 

    def create 
        landlord_review = LandlordReview.new(landlord_review_params)
        if landlord_review.save 
            redirect_to landlord_review_path(landlord_review)
        else 
            flash[:errors] = landlord_review.errors.full_messages
            redirect_to new_landlord_review_path
        end 
    end 

    def show 
        @landlord_review = LandlordReview.find(params[:id])
        @landlord = @landlord_review.landlord
        @tenant = @landlord_review.tenant
        @overall_rating = @landlord_review.rating
    end 

    def edit 
        @landlord_review = LandlordReview.find(params[:id])
    end 

    def update 
        landlord_review = LandlordReview.find(params[:id])
        landlord_review.update(landlord_review_params)
        redirect_to landlord_review_path(landlord_review)
    end 

    def delete
        landlord_review = LandlordReview.find(params[:id])
        landlord_review.destroy
        redirect_to landlord_reviews_path
    end 

    #custom routes

    def new_specific_review
        @landlord = Landlord.find(params[:landlord_id])
        @tenant = current_tenant
        @landlord_review = @tenant.landlord_reviews.build
        @landlord_review.landlord = @landlord
    end 

    def create_specific_review
        specific_landlord_review = LandlordReview.new(landlord_review_params)
        if specific_landlord_review.save 
            redirect_to landlord_review_path(specific_landlord_review)
        else 
            flash[:errors] = landlord_review.errors.full_messages
            redirect_to new_specific_landlord_review_path
        end 
    end 


    private 

    def landlord_review_params
        params.require(:landlord_review).permit(:title, :content, :hotness, :rating, :landlord_id, :tenant_id)
    end 

end
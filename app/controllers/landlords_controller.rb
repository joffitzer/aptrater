class LandlordsController < ApplicationController

    def index 
        @landlords = Landlord.all
    end 

    def new 
        @landlord = Landlord.new
    end 

    def create 
        landlord = Landlord.new(landlord_params)
        if landlord.save 
            redirect_to landlord_path(landlord)
        else 
            flash[:errors] = landlord.errors.full_messages
            redirect_to new_landlord_path
        end
    end 

    def show 
        @landlord = Landlord.find(params[:id])
        @landlord_reviews = LandlordReview.all.select do |landlord_review|
            landlord_review.landlord == @landlord 
        end 
        @building_addresses = @landlord.buildings.each do |building|
            building.address
        end 
        @ratings = @landlord_reviews.map do |review|
            review.rating
        end
        @average_rating = @ratings.sum.to_f / @ratings.count
    end 

    def edit 
        @landlord = Landlord.find(params[:id])
    end 

    def update 
        landlord = Landlord.find(params[:id])
        if landlord.update(landlord_params)
            redirect_to landlord_path(landlord)
        else 
            flash[:errors] = landlord.errors.full_messages
            redirect_to edit_landlord_path(landlord)
        end 
    end 

    def delete
        landlord = Landlord.find(params[:id])
        landlord.destroy
        redirect_to landlords_path
    end 


    private 

    def landlord_params
        params.require(:landlord).permit(:name, :nickname, :avatar)
    end 

end 
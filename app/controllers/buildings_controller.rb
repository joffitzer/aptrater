class BuildingsController < ApplicationController

    def index 
        @buildings = Building.all
        street_addresses = @buildings.map do |building|
            building.address
        end
        @addresses = street_addresses.sort
    end 

    def new 
        @building = Building.new
    end 

    def create 
        building = Building.new(building_params)
        if building.save 
            redirect_to building_path(building)
        else 
            flash[:errors] = building.errors.full_messages
            redirect_to new_building_path
        end
    end 

    def show 
        @building = Building.find(params[:id])
        @reviews = BuildingReview.all.select do |review|
            review.building == @building
        end 
        @avg_cleanliness = cleanliness_avg
        @avg_super = super_avg
        @avg_noise = noise_avg
        @overall_avg = overall_avg
        @renewal_avg = renewal_avg
    end 

    def edit 
        @building = Building.find(params[:id])
    end 

    def update 
        building = Building.find(params[:id])
        if building.update(building_params)
            redirect_to building_path(building)
        else 
            flash[:errors] = building.errors.full_messages
            redirect_to edit_building_path(building)
        end 
    end 

    def delete
        building = Building.find(params[:id])
        building.destroy
        redirect_to buildings_path
    end 


    private 

    def building_params
        params.require(:building).permit(:address, :neighborhood, :description, :apt_count, :landlord_id)
    end 

    def cleanliness_avg
        cleanliness_scores = @reviews.map do |review|
            review.cleanliness
        end 
        @avg_cleanliness = cleanliness_scores.sum.to_f / cleanliness_scores.count
    end 

    def super_avg
        super_scores = @reviews.map do |review|
            review.super
        end 
        @avg_super = super_scores.sum.to_f / super_scores.count
    end 

    def noise_avg
        noise_scores = @reviews.map do |review|
            review.noise
        end 
        @avg_noise = noise_scores.sum.to_f / noise_scores.count
    end 

    def overall_avg
        @overall_avg = (@avg_cleanliness + @avg_noise + @avg_super) / 3
    end 

    def renewal_avg
        renewal_scores = @reviews.map do |review|
            review.renew
        end 
        @avg_renewal = renewal_scores.count(true).to_f / renewal_scores.count
    end 

end 
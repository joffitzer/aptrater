class BuildingsController < ApplicationController

    def index 
        @buildings = Building.all
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
        params.require(:building).permit(:address, :neighborhood, :description, :apt_count)
    end 

end 
class Building < ApplicationRecord
    has_many :building_reviews 
    has_many :tenants, through: :building_reviews
    belongs_to :landlord
    validates :address, uniqueness: true
    attr_accessor :average_rating


    def self.sorted_with_average
        buildings = self.all.sort_by { |b| b.address.match(/[a-zA-Z]+/).to_s }
        buildings.each do |building|
            building.average_rating = building.overall_average
        end
    end
    
    def overall_average
        (cleanliness_avg + noise_avg + super_avg) / 3
    end 
    
    private 

   
    def cleanliness_avg
        cleanliness_scores = self.building_reviews.map do |review|
            review.cleanliness
        end 
        cleanliness_scores.sum.to_f / cleanliness_scores.count
    end 

    def super_avg
        super_scores = self.building_reviews.map do |review|
            review.super
        end 
        super_scores.sum.to_f / super_scores.count
    end 

    def noise_avg
        noise_scores = self.building_reviews.map do |review|
            review.noise
        end 
        noise_scores.sum.to_f / noise_scores.count
    end 

end

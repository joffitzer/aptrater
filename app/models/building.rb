class Building < ApplicationRecord
    has_many :building_reviews 
    has_many :tenants, through: :building_reviews
    belongs_to :landlord
    validates :address, uniqueness: true

    def overall_average
        @reviews = BuildingReview.all.select do |review|
            review.building == self
        end 
        @overall_avg = overall_avg
    end 

    private 

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
        (cleanliness_avg + noise_avg + super_avg) / 3
    end 
end

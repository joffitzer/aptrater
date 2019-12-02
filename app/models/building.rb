class Building < ApplicationRecord
    has_many :building_reviews 
    has_many :tenants, through: :building_reviews
    validates :address, uniqueness: true
end

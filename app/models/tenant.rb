class Tenant < ApplicationRecord
    has_many :building_reviews 
    has_many :buildings, through: :building_reviews
    validates :name, uniqueness: true
    validates :username, uniqueness: true
end

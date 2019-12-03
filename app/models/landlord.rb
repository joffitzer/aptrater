class Landlord < ApplicationRecord
    has_many :landlord_reviews 
    has_many :tenants, through: :landlord_reviews 
    has_many :buildings 
end

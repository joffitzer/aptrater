class Tenant < ApplicationRecord
    has_many :building_reviews 
    has_many :buildings, through: :building_reviews
    has_many :landlord_reviews 
    has_many :landlords, through: :landlord_reviews 
    validates :username, uniqueness: { case_sensitive: false }
    has_secure_password
end

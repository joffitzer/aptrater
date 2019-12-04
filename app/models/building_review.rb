class BuildingReview < ApplicationRecord
    belongs_to :tenant
    belongs_to :building
    validates :title, presence: true
end

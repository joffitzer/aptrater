module BuildingReviewsHelper

    def reviewed_by_content(review)
        if review.tenant 
            link_to review.tenant.username, tenant_path(review.tenant)
        else 
            "The author of this review no longer has a Rate my Rental profile."
        end 
    end 

    def building_reviewed(review)
        if review.building 
            link_to review.building.address, building_path(review.building)
        else 
            "This building no longer has a Rate my Rental profile."
        end 
    end 

    def landlord_reviewed(review)
        if review.landlord 
            link_to review.landlord.name, landlord_path(review.landlord)
        else 
            "This landlord no longer has a Rate my Rental profile."
        end 
    end 
    
end 
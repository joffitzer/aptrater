# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def building_images 
    images = ["https://untappedcities-wpengine.netdna-ssl.com/wp-content/uploads/2018/09/Flatiron-Building-Secrets-Roof-Basement-Elevator-Sonny-Atis-GFP-NYC_50.jpg", "https://archinect.imgix.net/uploads/e2/e291f3f75093ce843c26a5d92d4a132e.jpeg?auto=compress%2Cformat", "https://livingin.citihabitats.com/wp-content/uploads/2018/03/iStock-813211306.jpg", "https://si.wsj.net/public/resources/images/B3-DU640_TENANT_GR_20190424171641.jpg", "https://media.equityapartments.com/images/c_crop,x_0,y_0,w_1920,h_1080/c_fill,w_1920,h_1080/q_80/4119-35/west-54th-apartments-exterior.jpg", "https://wp.zillowstatic.com/streeteasy/2/GettyImages-471058787-a8ccfb.jpg", "https://thenypost.files.wordpress.com/2019/06/shutterstock_204186154.jpg?quality=90&strip=all&w=618&h=410&crop=1", "https://ephemeralnewyork.files.wordpress.com/2016/05/windermeremichaelminn2.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Pik39jAVDTeqD4pSM8yNhCKkV9xbvWFA3GxcmYJbnP-0v1soRg&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPONzuu42-7NKQkL8aGtln0Rb-iA2psYti9HkqvognYq99zkiStA&s", "https://previews.123rf.com/images/deberarr/deberarr1610/deberarr161000003/65982306-tree-lined-block-of-apartment-buildings-in-manhattan-new-york-city.jpg", "https://media.equityapartments.com/images/c_crop,x_0,y_0,w_1920,h_1080/c_fill,w_1920,h_1080/q_80/4129-1/the-westmont-apartments-exterior.jpg", "https://untappedcities-wpengine.netdna-ssl.com/wp-content/uploads/2015/06/Pre-war-The-Washington-Heights-Washington-Heights-NYC-01-Untapped-Cities-Jeff-Reuben.jpg", "https://thenypost.files.wordpress.com/2019/06/shutterstock_204186154.jpg?quality=90&strip=all&w=618&h=410&crop=1"]
end 

puts 'Destroying Tenants'
Tenant.destroy_all

puts 'Creating Tenants'
20.times do 
    Tenant.create(
        name: Faker::FunnyName.two_word_name, 
        username: Faker::Lorem.word,
        avatar: Faker::Avatar.image,
        password: "123"
        )
end 

puts 'Destroying Landlords'
Landlord.destroy_all

puts 'Creating Landlords'
10.times do 
    Landlord.create(
        name: Faker::FunnyName.name_with_initial, 
        nickname: Faker::GreekPhilosophers.name,
        avatar: Faker::Avatar.image
        )
end 

puts 'Destroying Buildings'
Building.destroy_all

puts 'Creating Buildings'
20.times do 
    Building.create(
        address: Faker::Address.street_address, 
        neighborhood: Faker::Address.community,
        description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
        apt_count: Faker::Number.between(from: 20, to: 100),
        landlord_id: Landlord.all.sample.id,
        image: building_images.sample
        )
end 

puts 'Destroying Building Reviews'
BuildingReview.destroy_all

puts 'Creating Building Reviews'
50.times do 
    BuildingReview.create(
        title: Faker::Hipster.sentence(word_count: 3), 
        content: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
        cleanliness: Faker::Number.between(from: 1, to: 5),
        super: Faker::Number.between(from: 1, to: 5),
        noise: Faker::Number.between(from: 1, to: 5),
        renew: Faker::Boolean.boolean,
        building_id: Building.all.sample.id,
        tenant_id: Tenant.all.sample.id
        )
end 

puts 'Destroying Landlord Reviews'
LandlordReview.destroy_all

puts 'Creating Landlord Reviews'
50.times do 
    LandlordReview.create(
        title: Faker::Hipster.sentence(word_count: 3), 
        content: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
        rating: Faker::Number.between(from: 1, to: 5),
        hotness: Faker::Boolean.boolean,
        landlord_id: Landlord.all.sample.id,
        tenant_id: Tenant.all.sample.id
        )
end 
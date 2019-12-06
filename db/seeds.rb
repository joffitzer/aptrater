# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def building_images 
    images = ["https://untappedcities-wpengine.netdna-ssl.com/wp-content/uploads/2018/09/Flatiron-Building-Secrets-Roof-Basement-Elevator-Sonny-Atis-GFP-NYC_50.jpg", "https://archinect.imgix.net/uploads/e2/e291f3f75093ce843c26a5d92d4a132e.jpeg?auto=compress%2Cformat", "https://livingin.citihabitats.com/wp-content/uploads/2018/03/iStock-813211306.jpg", "https://si.wsj.net/public/resources/images/B3-DU640_TENANT_GR_20190424171641.jpg", "https://media.equityapartments.com/images/c_crop,x_0,y_0,w_1920,h_1080/c_fill,w_1920,h_1080/q_80/4119-35/west-54th-apartments-exterior.jpg", "https://wp.zillowstatic.com/streeteasy/2/GettyImages-471058787-a8ccfb.jpg", "https://thenypost.files.wordpress.com/2019/06/shutterstock_204186154.jpg?quality=90&strip=all&w=618&h=410&crop=1", "https://ephemeralnewyork.files.wordpress.com/2016/05/windermeremichaelminn2.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Pik39jAVDTeqD4pSM8yNhCKkV9xbvWFA3GxcmYJbnP-0v1soRg&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPONzuu42-7NKQkL8aGtln0Rb-iA2psYti9HkqvognYq99zkiStA&s", "https://previews.123rf.com/images/deberarr/deberarr1610/deberarr161000003/65982306-tree-lined-block-of-apartment-buildings-in-manhattan-new-york-city.jpg", "https://media.equityapartments.com/images/c_crop,x_0,y_0,w_1920,h_1080/c_fill,w_1920,h_1080/q_80/4129-1/the-westmont-apartments-exterior.jpg", "https://untappedcities-wpengine.netdna-ssl.com/wp-content/uploads/2015/06/Pre-war-The-Washington-Heights-Washington-Heights-NYC-01-Untapped-Cities-Jeff-Reuben.jpg", "https://thenypost.files.wordpress.com/2019/06/shutterstock_204186154.jpg?quality=90&strip=all&w=618&h=410&crop=1", 
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10gPKmMXu-ayGRpirrKiN5BVSmU8w04EowE0RuJm0a38NiayA&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX_7cZISUrp8OQPJbJ_3N5mGFEg2_V9PGb-AEVWHe9JKTChtq58A&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNonfUDBCjNQ-OZOBhsO5l9iFVK9Ye01VzceCYoDF1icUpffL6Xw&s", "https://cdn.vox-cdn.com/thumbor/be3FGO_Jjv8C6b2R9HZryP-4eFo=/0x0:768x1024/1200x800/filters:focal(264x233:386x355)/cdn.vox-cdn.com/uploads/chorus_image/image/58925845/1_00858_0017.k3i1bJzj.0.jpg", "https://wp.zillowstatic.com/streeteasy/2/GettyImages-668941170-4a6668.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQao52pE1QEiShBjBjjG82Oc8pimc8niRNfHwlTrIUqyIrduL6P&s", "https://media.timeout.com/images/103380803/630/472/image.jpg", "https://i.redd.it/odm9dycvhsb21.jpg", "https://www.constructionspecifier.com/wp-content/uploads/2019/05/Opener-3.jpg", "https://live.staticflickr.com/5005/5234198661_88520ae8e7_b.jpg", "https://convene.com/wp-content/uploads/2018/09/DSC_0109-e1537815767286.jpg", "https://media.wired.com/photos/5926a7b47034dc5f91bec31a/master/w_2000,h_3000,c_limit/Yankus_Nineteenth-Street.jpg",
    "https://cdn.bisnow.net/fit?height=489&type=jpeg&url=https%3A%2F%2Fs3.amazonaws.com%2Fcdn.bisnow.net%2Fcontent%2Fimages%2F2018%2F07%2F5b5f22dc9fff9_Terminal_Stores.jpeg&width=717&sign=jvuXAwzoQwVB3X9xzUW2Iy7KkRlZwT-pC5GkkoN17x0", "https://cms.qz.com/wp-content/uploads/2019/10/Four-Buildings-Marc-Yankus-2017-e1570130757643.jpg?quality=75&strip=all&w=410&h=231", "https://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1476137482/three-buildings-W13-NYCYANKUS1016.jpg?itok=pLeS2OQN", "https://ephemeralnewyork.files.wordpress.com/2016/04/alabamafacade.jpg", "https://newyorkyimby.com/wp-content/uploads/2016/04/MARCH_626First_02-CityHeroDusk_FINAL-JDS_RESIZE-720x1200.jpg", "https://ds4.cityrealty.com/img/2fc71d3d5d61d45ca4b9999006da5e291c80ac86+400++0+60/834-fifth-avenue.jpg", "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fheathersenison%2Ffiles%2F2018%2F11%2FDakota.jpg", "https://cdn.vox-cdn.com/thumbor/LkIXCFal6GFejPPH4cFz092cWn4=/0x0:3000x2000/1200x800/filters:focal(1260x760:1740x1240)/cdn.vox-cdn.com/uploads/chorus_image/image/56362987/shutterstock_234327418.1503676826.jpg", "https://media.equityapartments.com/images/c_crop,x_0,y_0,w_1920,h_1080/c_fill,w_1920,h_1080/q_80/2461-22/hudson-crossing-apartments-exterior.jpg", "https://wp.zillowstatic.com/streeteasy/2/156467825-960d74.jpg", "https://www.propertyshark.com/img/mkt_email/Building-Class-NYC/Building_Class_D3.jpg", "https://www.propertyshark.com/img/mkt_email/Building-Class-NYC/Building_Class_D1.jpg", "https://newconstructionmanhattan.com/sites/default/files/uploads/new_construction_in_new_york_city.png", "https://as1.ftcdn.net/jpg/01/23/18/02/500_F_123180242_qjF3w0Zo3J7HZtASzBGzlqpBTK9qAXLq.jpg", "https://images.datahubus.com/core_data/image/file/54f62e/345170/8f20bc/d20ba6/new_york_brownstone_apartment.jpg"]
end 

puts 'Destroying Tenants'
Tenant.destroy_all

puts 'Creating Tenants'
50.times do 
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
25.times do 
    Landlord.create(
        name: Faker::FunnyName.name_with_initial, 
        nickname: Faker::GreekPhilosophers.name,
        avatar: Faker::Avatar.image
        )
end 

puts 'Destroying Buildings'
Building.destroy_all

puts 'Creating Buildings'
100.times do 
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
200.times do 
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
100.times do 
    LandlordReview.create(
        title: Faker::Hipster.sentence(word_count: 3), 
        content: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
        rating: Faker::Number.between(from: 1, to: 5),
        hotness: Faker::Boolean.boolean,
        landlord_id: Landlord.all.sample.id,
        tenant_id: Tenant.all.sample.id
        )
end 
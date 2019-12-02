# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Destroying Tenants'
Tenant.destroy_all

puts 'Creating Tenants'
20.times do 
    Tenant.create(
        name: Faker::FunnyName.two_word_name, 
        username: Faker::Lorem.word
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
        apt_count: Faker::Number.between(from: 20, to: 100)
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
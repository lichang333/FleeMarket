# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.all
users.each do |u|
  puts "creating 2 items for #{u.nickName}..."
  2.times do
    Item.create(
      user_id: u.id,
      title: Faker::HitchhikersGuideToTheGalaxy.starship,
      condition: ["brandnew", "like new", "somewhat used", "used", "very used"].sample,
      description: Faker::HitchhikersGuideToTheGalaxy.quote,
      remote_cover_image_url: "https://picsum.photos/400/400?image=#{(1..10).to_a.sample}",
      city: u.city
      )
  end
  puts "2 times created for #{u.nickName}!"
end

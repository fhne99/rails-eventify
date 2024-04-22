# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Event.destroy_all
user = User.create(email: "honorine@wagon.com", password: "123456")

# Création des events
4.times do |i|
  event = user.events.create(
    title: "Event #{i+1}",
    description: "Description for event #{i+1}",
    start_date: Time.now + i.days,
    end_date: Time.now + (i+1).days,
    location: "Bordeaux",
    category: Event::CATEGORIES.sample,
    available_tickets: rand(1..50)
  )
  puts "Created event: #{event.title}"

# Création des prix
  3.times do |j|
    event.prices.create(
      ticket_price: rand(10..100),
      category: ["VIP", "Normal", "Student"].sample
    )
  end

  puts "Created prices for event: #{event.title}"
end

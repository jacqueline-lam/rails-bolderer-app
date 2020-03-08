# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Running DB seed..."

# Don't let seed duplicate data more than once
puts "Dropping DB..."
Style.destroy_all
ProblemStyle.destroy_all
Problem.destroy_all
Send.destroy_all
User.destroy_all

# Create Wall instances - predetermined names
walls = [
  "Pipe",
  "Do Not Top Out",
  "Cave",
  "Traverse",
  "Positivity",
  "Logo",
  "Pineapple",
  "Setter's Closet",
  "Barrel"
]

puts "Creating set Walls..."
walls.each do |wall|
  Wall.create(name: wall)
end

# Create Style instances - predetermined names
styles = [
  "dyno",
  "crimps",
  "jugs",
  "slopers",
  "pinches",
  "pockets",
  "body tension",
  "compression",
  "powerful",
  "overhang",
  "flexible",
  "balance",
  "dihedral",
  "slab",
  "mantle",
  "gaston"
]

puts "Creating base Styles..."
styles.each do |style|
  Style.create(name: style)
end


# seed DB with dummy data
# users and their respective problems
puts "Creating sample Users..."
user_1 = User.new({username: "jackie", password: "12345"})
user_2 = User.new({username: "sam", password: "54321"})
user_3 = User.new({username: "natalie", password: "67890"})
user_1.save!
user_2.save!
user_3.save!


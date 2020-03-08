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


problem_data = [
  # Sent by User 1
  ["Red V5", "red", "V5", 5, '<blockquote class="imgur-embed-pub" lang="en" data-id="f6jea5L"><a href="//imgur.com/f6jea5L">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["compression", "slab"], "Pineapple"],
  ["Black V3", "black", "V3", 3, '<blockquote class="imgur-embed-pub" lang="en" data-id="yE9bcDH"><a href="//imgur.com/yE9bcDH">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "slab"], "Pineapple"],
  ["White V4", "white", "V4", 4, '<blockquote class="imgur-embed-pub" lang="en" data-id="qhovyFu"><a href="//imgur.com/qhovyFu">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["jugs", "powerful", "flexible"], "Pineapple"],
  ["Yellow V4", "yellow", "V4", 4, '<blockquote class="imgur-embed-pub" lang="en" data-id="whnG7Sd"><a href="//imgur.com/whnG7Sd">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "flexible", "balance", "slab"], "Logo"],
  ["Black V4", "black", "V4", 4, '<blockquote class="imgur-embed-pub" lang="en" data-id="WlIv118"><a href="//imgur.com/WlIv118">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["body tension", "flexible", "mantle"], "Positivity"],
  # Sent by User 2
  ["Blue V6", "blue", "V6", 6, 'No original image available', ["crimps", "body tension", "flexible"], "Pineapple"],
  ["Black V6", "black", "V6", 6, 'No original image available', ["pinches", "body tension", "powerful", "overhang"], "Barrel"],
  ["Black V5", "black", "V5", 5, '<blockquote class="imgur-embed-pub" lang="en" data-id="jod5gFX"><a href="//imgur.com/jod5gFX">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["body tension", "compression", "powerful"], "Pineapple"],
  ["Yellow V7", "yellow", "V7", 7, 'No original image available', ["crimps", "pinches", "powerful", "overhang"], "Pipe"],
  ["Pink V7", "pink", "V7", 7, 'No original image available', ["crimps", "body tension", "powerful"], "Pineapple"],
  # Sent by User 3
  ["Blue V8", "blue", "V8", 8, '<blockquote class="imgur-embed-pub" lang="en" data-id="mbyzIOA"><a href="//imgur.com/mbyzIOA">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "body tension", "powerful"], "Pipe"],
  ["Pink V8", "pink", "V8", 8, '<blockquote class="imgur-embed-pub" lang="en" data-id="Rc01Obn"><a href="//imgur.com/Rc01Obn">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "slopers", "pinches", "body tension"], "Pipe"],
  ["Blue V9", "blue", "V9", 9, '<blockquote class="imgur-embed-pub" lang="en" data-id="mBoDq6d"><a href="//imgur.com/mBoDq6d">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "body tension", "powerful"], "Positivity"]
]

base_date = '3/1/2020'.to_date

# Create dummy Problems
puts "Creating dummy Problems..."
problem_data.each do |data|
  p = Problem.create(
    name: data[0],
    color: data[1],
    grade: data[2],
    points: data[3],
    image: data[4],
  )

  wall_name = data[6]
  puts "Adding wall_id to problem #{p.id}."
  p.wall_id = Wall.find_by(name: wall_name).id
  p.save!

  # manually change created_at date:
  puts "Updating created_at timestamp to #{base_date}."
  p.update(created_at: base_date)

  style_names = data[5]
  puts "Adding #{style_names} styles to problem #{p.id}."
  # retutn array of style instances for each problem
  styles_with_these_names = style_names.map { |name| Style.find_by(name: name) }
  # Create ProblemStyle to make the many-to-many relation
  styles_with_these_names.each do |style|
    ps = ProblemStyle.new
    ps.problem_id = p.id
    ps.style_id = style.id
    ps.save!
  end
end

send_data = [
  # Sent by User 1
  [base_date + 7.day, 5, 'No image by user', user_1.id, "Red V5"],
  [base_date + 7.day, 1, 'No image by user', user_1.id, "Black V3"],
  [base_date + 1.day, 2, 'No image by user', user_1.id, "White V4"],
  [base_date + 3.day, 1, 'No image by user', user_1.id, "Yellow V4"],
  [base_date + 5.day, 1, 'No image by user', user_1.id, "Black V4"],
  # Sent by User 2
  [base_date, 3, '<blockquote class="imgur-embed-pub" lang="en" data-id="WfBSvVr"><a href="//imgur.com/WfBSvVr">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', user_2.id, "Blue V6"],
  [base_date, 5, '<blockquote class="imgur-embed-pub" lang="en" data-id="Tz1Ea67"><a href="//imgur.com/Tz1Ea67">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', user_2.id, "Black V6"],
  [base_date + 1.day, 1, 'No image by user', user_2.id, "Black V5"],
  [base_date + 3.day, 6, '<blockquote class="imgur-embed-pub" lang="en" data-id="5D6KV7C"><a href="//imgur.com/5D6KV7C">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', user_2.id, "Yellow V7"],
  [base_date + 5.day, 8, '<blockquote class="imgur-embed-pub" lang="en" data-id="pKogmXZ"><a href="//imgur.com/pKogmXZ">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', user_2.id, "Pink V7"],
  # Sent by User 3
  [base_date + 3.day, 3, 'No image by user', user_3.id, "Blue V8"],
  [base_date + 3.day, 5, 'No image by user', user_3.id, "Pink V8"],
  [base_date + 5.day, 7, 'No image by user', user_3.id, "Blue V9"],
]

# Create dummy Sends
puts "Creating dummy Sends..."

send_data.each do |data|
  s = Send.create(
    date_sent: data[0],
    attempts: data[1],
    image: data[2],
    user_id: data[3]
  )

  problem_name = data[4]
  puts "Adding #{problem_name} to send #{s.id}"
  s.problem_id = Problem.find_by(name: problem_name).id
  s.save!
end

puts "All dummy data have been seeded."
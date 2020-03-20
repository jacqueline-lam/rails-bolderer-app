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
Problem.destroy_all
Send.destroy_all
User.destroy_all
Style.destroy_all
ProblemStyle.destroy_all


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
user_1 = User.new({username: "jackie", password: "12345", password_confirmation: "12345"})
user_2 = User.new({username: "sam", password: "54321", password_confirmation: "54321"})
user_3 = User.new({username: "natalie", password: "67890", password_confirmation: "67890"})
user_1.save!
user_2.save!
user_3.save!

base_date = '1/2/2020'.to_date

problem_data = [
  # Sent by User 1
  [base_date + 1.month, "Red V5", "Red", "V5", 5, '<blockquote class="imgur-embed-pub" lang="en" data-id="f6jea5L"><a href="//imgur.com/f6jea5L">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["compression", "slab"], "Pineapple"],
  [base_date, "Black V3", "Black", "V3", 3, '<blockquote class="imgur-embed-pub" lang="en" data-id="yE9bcDH"><a href="//imgur.com/yE9bcDH">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "slab"], "Pineapple"],
  [base_date, "White V4", "White", "V4", 4, '<blockquote class="imgur-embed-pub" lang="en" data-id="qhovyFu"><a href="//imgur.com/qhovyFu">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["jugs", "powerful", "flexible"], "Pineapple"],
  [base_date, "Yellow V4", "Yellow", "V4", 4, '<blockquote class="imgur-embed-pub" lang="en" data-id="whnG7Sd"><a href="//imgur.com/whnG7Sd">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "flexible", "balance", "slab"], "Logo"],
  [base_date, "Black V4", "Black", "V4", 4, '<blockquote class="imgur-embed-pub" lang="en" data-id="WlIv118"><a href="//imgur.com/WlIv118">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["body tension", "flexible", "mantle"], "Positivity"],
  [base_date + 1.month, "Sketchy White V4", "White", "V4", 4, 'No original image available', ["slopers", "body tension", "compression", "overhang"], "Pineapple"],
  [base_date + 1.month, "Slopey Black V5", "Black", "V5", 5, 'No original image available', ["slopers", "powerful", "slab", "flexible", "balance"], "Cave"],
  [base_date + 1.month, "Technical Green V5", "Green", "V5", 5, "No original image available", ["pinches", "body tension", "overhang", "balance"], "Positivity"],
  [base_date + 1.month, "Purple V6", "Purple", "V6", 6, "No original image available", ["pinches", "body tension", "compression", "powerful", "overhang", "balance"], "Positivity"],
  [base_date + 1.month, "White Deadpoint V5", "White", "V5", 5, "No original image available", ["slopers", "pinches", "body tension", "flexible", "balance", "slab"], "Traverse"],

  # Sent by User 2
  [base_date, "Blue V6", "Blue", "V6", 6, 'No original image available', ["crimps", "body tension", "flexible"], "Pineapple"],
  [base_date, "Black V6", "Black", "V6", 6, 'No original image available', ["pinches", "body tension", "powerful", "overhang"], "Barrel"],
  [base_date, "Black V5", "Black", "V5", 5, '<blockquote class="imgur-embed-pub" lang="en" data-id="jod5gFX"><a href="//imgur.com/jod5gFX">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["body tension", "compression", "powerful"], "Pineapple"],
  [base_date, "Yellow V7", "Yellow", "V7", 7, 'No original image available', ["crimps", "pinches", "powerful", "overhang"], "Pipe"],
  [base_date + 1.month, "Pink V7", "Pink", "V7", 7, 'No original image available', ["crimps", "body tension", "powerful"], "Pineapple"],
  [base_date + 1.month, "Black V7", "Black", "V7", 7, 'No original image available', ["slopers", "pinches", "compression", "powerful", "overhang"], "Positivity"],
  # Sent by User 3
  [base_date, "Blue V8", "Blue", "V8", 8, '<blockquote class="imgur-embed-pub" lang="en" data-id="mbyzIOA"><a href="//imgur.com/mbyzIOA">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "body tension", "powerful"], "Pipe"],
  [base_date, "Pink V8", "Pink", "V8", 8, '<blockquote class="imgur-embed-pub" lang="en" data-id="Rc01Obn"><a href="//imgur.com/Rc01Obn">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "slopers", "pinches", "body tension"], "Pipe"],
  [base_date + 1.month , "Blue V9", "Blue", "V9", 9, '<blockquote class="imgur-embed-pub" lang="en" data-id="mBoDq6d"><a href="//imgur.com/mBoDq6d">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "body tension", "powerful"], "Positivity"]
]


# Create dummy Problems
puts "Creating dummy Problems..."
problem_data.each do |data|
  p = Problem.create(
    name: data[1],
    color: data[2],
    grade: data[3],
    points: data[4],
    image: data[5],
  )

  wall_name = data[7]
  puts "Adding wall_id to problem #{p.id}."
  p.wall_id = Wall.find_by(name: wall_name).id
  p.save!

  # manually change created_at date:
  puts "Updating created_at timestamps."
  p.update(created_at: data[0])

  style_names = data[6]
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
  [base_date + 7.day, 5, nil, false, user_1.id, "Red V5"],
  [base_date + 7.day, 1, nil, false, user_1.id, "Black V3"],
  [base_date + 1.day, 2, nil, false, user_1.id, "White V4"],
  [base_date + 3.day, 1, nil, false, user_1.id, "Yellow V4"],
  [base_date + 5.day, 1, nil, false, user_1.id, "Black V4"],
  [base_date + 7.day, 10, '<blockquote class="imgur-embed-pub" lang="en" data-id="a/AqqqeYY"><a href="//imgur.com/AqqqeYY"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', false, user_1.id "Black V5"],
  [base_date + 1.month + 1.day, 2, '<blockquote class="imgur-embed-pub" lang="en" data-id="BWXmhDe"><a href="//imgur.com/BWXmhDe"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', false, user_1.id, "Sketchy White V4"],
  [base_date + 1.month + 1.day, 5, '<blockquote class="imgur-embed-pub" lang="en" data-id="Ow60old"><a href="https://imgur.com/Ow60old">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', false, user_1.id, "Slopey Black V5"],
  [base_date + 1.month + 5.day, 5, '<blockquote class="imgur-embed-pub" lang="en" data-id="KbYlRIY"><a href="https://imgur.com/KbYlRIY">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', true, user_1.id, "Technical Green V5"]
  [base_date + 1.month + 15.day, 23, '<blockquote class="imgur-embed-pub" lang="en" data-id="CzGchCO"><a href="https://imgur.com/CzGchCO">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', true, user_1.id, "Purple V6"]
  [base_date + 1.month + 1.day, 4, '<blockquote class="imgur-embed-pub" lang="en" data-id="fpgHgnx"><a href="https://imgur.com/fpgHgnx">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', false, user_1.id, "White Deadpoint V5"]
  # Sent by User 2
  [base_date, 3, '<blockquote class="imgur-embed-pub" lang="en" data-id="WfBSvVr"><a href="//imgur.com/WfBSvVr">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', false, user_2.id, "Blue V6"],
  [base_date, 5, '<blockquote class="imgur-embed-pub" lang="en" data-id="Tz1Ea67"><a href="//imgur.com/Tz1Ea67">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', false, user_2.id, "Black V6"],
  [base_date + 1.day, 1, nil, user_2.id, false, "Black V5"],
  [base_date + 3.day, 6, '<blockquote class="imgur-embed-pub" lang="en" data-id="5D6KV7C"><a href="//imgur.com/5D6KV7C">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', true, user_2.id, "Yellow V7"],
  [base_date + 1.month, 10.day, 15, '<blockquote class="imgur-embed-pub" lang="en" data-id="pKogmXZ"><a href="//imgur.com/pKogmXZ">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', true, user_2.id, "Pink V7"],
  [base_date + 1.month + 5.day, 8, '<blockquote class="imgur-embed-pub" lang="en" data-id="Fib4VTR"><a href="//imgur.com/Fib4VTR"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', false, user_2.id, "Black V7"],
  # Sent by User 3
  [base_date + 3.day, 3, nil, false, user_3.id, "Blue V8"],
  [base_date + 3.day, 5, nil, true, user_3.id, "Pink V8"],
  [base_date + 1.month + 5.day, 7, nil, true, user_3.id, "Blue V9"], 
]

# Create dummy Sends
puts "Creating dummy Sends..."

send_data.each do |data|
  s = Send.create(
    date_sent: data[0],
    attempts: data[1],
    image: data[2],
    favorite: data[3]
    user_id: data[4]
  )

  problem_name = data[5]
  puts "Adding #{problem_name} to send #{s.id}"
  s.problem_id = Problem.find_by(name: problem_name).id
  s.save!
end

puts "All dummy data have been seeded."
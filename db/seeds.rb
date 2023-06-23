require "csv"
require "open-uri"
require 'uri'
require 'net/http'
require 'openssl'
require 'active_support/inflector'

filepath = "db/fixtures/stages.csv"
filepath_riders = "db/fixtures/riders.csv"

puts "Cleaning the database"

User.destroy_all
Race.destroy_all
Rider.destroy_all

puts "Creating the races"

race1 = Race.new(
  name: 'Tour de France 2023',
  year: 2023,
  starting_date: '01/07/2023',
  ending_date: '23/07/2023'
)
race1.save!

puts "Creating races done"

puts "Creating the users"

user1 = User.new(
  first_name: 'Margaux',
  last_name: 'Pichard',
  username: 'marpich',
  email: 'margaux@gmail.com',
  password: 'margaux',
  admin: true
)
photomarpich = URI.open('https://res.cloudinary.com/dciokrtia/image/upload/v1653653443/photo-margaux_gr8cjn.jpg')
user1.photo.attach(io: photomarpich, filename: 'marpich.png', content_type: 'image/png')
user1.save!

user2 = User.new(
  first_name: 'Cedric',
  last_name: 'Le Brun',
  username: 'cedleb',
  email: 'cedric@gmail.com',
  password: 'cedric'
)
photocedleb = URI.open('https://res.cloudinary.com/dciokrtia/image/upload/v1653653052/photo-c%C3%A9dric_h6m7dd.jpg')
user2.photo.attach(io: photocedleb, filename: 'cedleb.jpg', content_type: 'image/jpg')
user2.save!

puts "Creating users done"

puts "Creating the stages"

CSV.foreach(filepath, headers: :first_row) do |row|
  image_map = URI.open(row['image_map'])
  stage = Stage.new(
    number: row[0],
    date: row['date'],
    stage_type: row['stage_type'],
    length: row['length'],
    departure: row['departure'],
    arrival: row['arrival']
  )
  stage.image.attach(io: image_map, filename: "stage#{row[0]}.png", content_type: 'image/png')
  stage.race = race1
  stage.save!
end

puts "Creating stages done"

puts "Creating the riders"
i = 1
CSV.foreach(filepath_riders, headers: :first_row) do |row|
  rider = Rider.new(
    last_name: row['last_name'],
    first_name: row['first_name'],
    team: row['team'],
    bib: i
  )
  i += 1
  # url = URI("https://pro-cycling-stats.p.rapidapi.com/riders/#{row['first_name'].parameterize}-#{row['last_name'].parameterize}")

  # http = Net::HTTP.new(url.host, url.port)
  # http.use_ssl = true
  # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  # request = Net::HTTP::Get.new(url)
  # request["X-RapidAPI-Key"] = ENV['API_KEY']
  # request["X-RapidAPI-Host"] = 'pro-cycling-stats.p.rapidapi.com'

  # response = http.request(request)
  # infos = response.read_body
  # rider.team = JSON.parse(infos).first["Main info"]["team"]
  # rider.nationality = JSON.parse(infos).first["Main info"]["countryFlag"]
  # rider.photo_url = JSON.parse(infos).first["Main info"]["riders photo url"]
  rider.save!
end

puts "Creating riders done"

puts "Creating the bets"

# bet11 = Bet.new(
#   user: user1,
#   stage: Stage.first,
#   position: 1,
#   rider: Rider.first
# )
# bet11.save!

# bet12 = Bet.new(
#   user: user1,
#   stage: Stage.first,
#   position: 2,
#   rider: Rider.second
# )
# bet12.save!

# bet13 = Bet.new(
#   user: user1,
#   stage: Stage.first,
#   position: 3,
#   rider: Rider.third
# )
# bet13.save!

# bet21 = Bet.new(
#   user: user1,
#   stage: Stage.second,
#   position: 1,
#   rider: Rider.first
# )
# bet21.save!

# bet22 = Bet.new(
#   user: user1,
#   stage: Stage.second,
#   position: 2,
#   rider: Rider.second
# )
# bet22.save!

# bet23 = Bet.new(
#   user: user1,
#   stage: Stage.second,
#   position: 3,
#   rider: Rider.third
# )
# bet23.save!

# bet31 = Bet.new(
#   user: user1,
#   stage: Stage.third,
#   position: 1,
#   rider: Rider.first
# )
# bet31.save!

# bet32 = Bet.new(
#   user: user1,
#   stage: Stage.third,
#   position: 2,
#   rider: Rider.second
# )
# bet32.save!

# bet33 = Bet.new(
#   user: user1,
#   stage: Stage.third,
#   position: 3,
#   rider: Rider.third
# )
# bet33.save!

# bet41 = Bet.new(
#   user: user2,
#   stage: Stage.first,
#   position: 1,
#   rider: Rider.third
# )
# bet41.save!

# bet42 = Bet.new(
#   user: user2,
#   stage: Stage.first,
#   position: 2,
#   rider: Rider.second
# )
# bet42.save!

# bet43 = Bet.new(
#   user: user2,
#   stage: Stage.first,
#   position: 3,
#   rider: Rider.first
# )
# bet43.save!

# bet51 = Bet.new(
#   user: user2,
#   stage: Stage.second,
#   position: 1,
#   rider: Rider.third
# )
# bet51.save!

# bet52 = Bet.new(
#   user: user2,
#   stage: Stage.second,
#   position: 2,
#   rider: Rider.second
# )
# bet52.save!

# bet53 = Bet.new(
#   user: user2,
#   stage: Stage.second,
#   position: 3,
#   rider: Rider.first
# )
# bet53.save!

# bet61 = Bet.new(
#   user: user2,
#   stage: Stage.third,
#   position: 1,
#   rider: Rider.third
# )
# bet61.save!

# bet62 = Bet.new(
#   user: user2,
#   stage: Stage.third,
#   position: 2,
#   rider: Rider.second
# )
# bet62.save!

# bet63 = Bet.new(
#   user: user2,
#   stage: Stage.third,
#   position: 3,
#   rider: Rider.first
# )
# bet63.save!

puts "Creating bets done"

puts "Creating the total scores"

total_score1 = TotalScore.new(
  race: race1,
  user: user1
)
total_score1.save!

total_score2 = TotalScore.new(
  race: race1,
  user: user2
)
total_score2.save!

puts "Creating total scores done"

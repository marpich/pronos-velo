require "csv"
require "open-uri"

filepath = "db/fixtures/stages.csv"
filepath_riders = "db/fixtures/riders.csv"

puts "Cleaning the database"

Bet.destroy_all
User.destroy_all
Result.destroy_all
Rider.destroy_all
Stage.destroy_all

puts "Creating the users"

user1 = User.new(
  first_name: 'Margaux',
  last_name: 'Pichard',
  username: 'marpich',
  email: 'margaux@gmail.com',
  password: 'margaux'
)
photomarpich = URI.open('https://res.cloudinary.com/dz21jxux5/image/upload/v1657199619/Photo_ID_Margaux_kv8adr.jpg')
user1.photo.attach(io: photomarpich, filename: 'marpich.png', content_type: 'image/png')
user1.save!

user2 = User.new(
  first_name: 'Cedric',
  last_name: 'Le Brun',
  username: 'cedleb',
  email: 'cedric@gmail.com',
  password: 'cedric'
)
photocedleb = URI.open('https://res.cloudinary.com/dz21jxux5/image/upload/v1657201107/cedric_lebrun_photo_d1sw55.jpg')
user2.photo.attach(io: photocedleb, filename: 'cedleb.png', content_type: 'image/png')
user2.save!

puts "Creating users done"

puts "Creating the stages"

CSV.foreach(filepath, headers: :first_row) do |row|
  image_map = URI.open(row['image_map'])
  stage = Stage.new(
    number: row['number'],
    date: row['date'],
    stage_type: row['stage_type'],
    length: row['length'],
    departure: row['departure'],
    arrival: row['arrival']
  )
  stage.image.attach(io: image_map, filename: "stage#{row['number']}.png", content_type: 'image/png')
  stage.save!
end

puts "Creating stages done"

puts "Creating the riders"

CSV.foreach(filepath_riders, headers: :first_row) do |row|
  rider = Rider.new(
    last_name: row['last_name'],
    first_name: row['first_name']
  )
  rider.save!
end

puts "Creating riders done"

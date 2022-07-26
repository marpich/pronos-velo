require "csv"
require "open-uri"
require 'uri'
require 'net/http'
require 'openssl'
require 'active_support/inflector'

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

  url = URI("https://pro-cycling-stats.p.rapidapi.com/riders/#{row['first_name'].parameterize}-#{row['last_name'].parameterize}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = 'e64cc11d1fmsh5015c34868ba754p1634f4jsn091f39c99d98'
  request["X-RapidAPI-Host"] = 'pro-cycling-stats.p.rapidapi.com'

  response = http.request(request)
  infos = response.read_body
  rider.team = JSON.parse(infos).first["Main info"]["team"]
  rider.nationality = JSON.parse(infos).first["Main info"]["countryFlag"]
  rider.photo_url = JSON.parse(infos).first["Main info"]["riders photo url"]
  rider.save!
end

puts "Creating riders done"

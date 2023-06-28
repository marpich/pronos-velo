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
CSV.foreach(filepath_riders, headers: :first_row) do |row|
  rider = Rider.new(
    last_name: row['last_name'],
    first_name: row['first_name'],
    team: row['team'],
    bib: row[0]
  )
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

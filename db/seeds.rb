require "csv"
require "open-uri"

filepath = "db/fixtures/stages.csv"

puts "Creating stages"

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

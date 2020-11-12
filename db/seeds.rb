# This seed file will import from a comma separated values file 
# named "seeds.csv" in the same directory.  It will assume that
# the csv file fields conform to the food_access_point model
# schema.
#
require 'csv'

# First, read and parse the file.
csv = CSV.parse(File.read(Rails.root.join('db', 'seeds.csv')), headers: true)

csv.each do |row|
  fap = FoodAccessPoint.new
  fap.address = row["address"]
  fap.town = row["town"]
  fap.state = row["state"]
  fap.zip = row["zip"]
  fap.name = row["name"]
  fap.phone_number = row["phone_number"]
  fap.website = row["website"]
  fap.website = "http://cnn.com" unless !fap.website.blank?
  fap.user_id = 1;
  fap.save
  puts fap.name + " saved." 
end
 



# Create and save new food_access_points.

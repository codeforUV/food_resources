# This seed file will import from a comma separated values file 
# named "seeds.csv" in the same directory.  It will assume that
# the csv file fields conform to the food_access_point model
# schema.
#
require 'csv'

# Create a demo user

user = User.create(email: "a@me.com", password: "123456")

puts user.email + " created."

# For Food Access Points, we use a csv file.  First step, read and parse the file.
csv = CSV.parse(File.read(Rails.root.join('db', 'seeds.csv')), headers: true)

# Create Food Access Points assigned to our user.
csv.each do |row|
  fap = user.food_access_points.build
  fap.address = row["address"]
  fap.town = row["town"]
  fap.state = row["state"]
  fap.zip = row["zip"]
  fap.name = row["name"]
  fap.phone_number = row["phone_number"]
  fap.website = row["website"]
  fap.website = "http://cnn.com" unless !fap.website.blank?
  fap.save
  puts fap.name + " saved." 
end
 



# Create and save new food_access_points.

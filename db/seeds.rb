# This seed file will import from a comma separated values file 
# named "seeds.csv" in the same directory.  It will assume that
# the csv file fields conform to the food_access_point model
# schema.
#
require 'csv'

user = User.find_or_initialize_by(email: "admin@example.com")
user.update(password: "123456")
user.save!

csv = CSV.parse(File.read(Rails.root.join('db', 'seeds.csv')), headers: true)

csv.each do |row|
  organization = Organization.find_or_create_by!(name: row["organization_name"])
  location = Location.find_or_create_by(organization: organization, name: row["organization_name"])
  service = Service.find_or_create_by!(name: row["service_name"], organization: organization, user: user)
  service.update(description: row["service_description"], url: row["url"])
  service_at_location = ServiceAtLocation.find_or_create_by!(location: location, service: service)
  PhysicalAddress.find_or_create_by(
    location: location,
    address: row["address"],
    city: row["city"],
    state_province: row["state_province"],
    postal_code: row["postal_code"],
    country: "USA"
  )
  if row["freq"] 
    Schedule.find_or_create_by!(
      service: service,
      location: location,
      service_at_location: service_at_location,
      freq: row["freq"],
      interval: row["interval"],
      byday: row["byday"],
      opens_at: row["opens_at"],
      closes_at: row["closes_at"],
    )
  end
  Phone.find_or_create_by!(
    location: location,
    service: service,
    organization: organization,
    service_at_location: service_at_location,
    number: row["phone"]
  )
end

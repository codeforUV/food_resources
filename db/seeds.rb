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
  food_pantry = FoodPantry.find_or_initialize_by(name: row["name"], user: user)
  food_pantry.assign_attributes(
    eligibility_criteria: row["eligibility_criteria"],
    notes: row["notes"],
    address: row["address"],
    town: row["town"],
    state: row["state"],
    phone_1: row["phone_1"],
    postal_code: row["postal_code"],
    url: row["url"]
  )

  food_pantry.phone_2 = row["phone_2"] if row["phone_2"]

  if row["freq"]
    day_map = {
      "SU" => :sunday,
      "MO" => :monday,
      "TU" => :tuesday,
      "WE" => :wednesday,
      "TH" => :thursday,
      "FR" => :friday,
      "SA" => :saturday
    }

    bydayindex = row["bydayindex"].to_i
    days = row["byday"].split(", ").map { |day| day_map[day] }
    opens_at_hour, opens_at_minutes = row["opens_at"].split(":")
    closes_at_hour, closes_at_minutes = row["closes_at"].split(":")
    start_time = Time.now.in_time_zone("Eastern Time (US & Canada)").change(hour: opens_at_hour, min: opens_at_minutes)
    end_time = Time.now.in_time_zone("Eastern Time (US & Canada)").change(hour: closes_at_hour, min: closes_at_minutes)
    duration = end_time - start_time
    schedule = IceCube::Schedule.new(start_time, duration: duration)

    if row["freq"] == "monthly"
      day_of_week = days.each_with_object({}) do |day, object|
        object[day] = [bydayindex.to_i]
      end

      rule = IceCube::Rule.monthly.day_of_week(day_of_week)
    elsif row["freq"] == "weekly"

      rule = IceCube::Rule.weekly.day(*days)
    end

    schedule.add_recurrence_rule(rule)
    existing_schedules = food_pantry.schedules
    new_schedules = existing_schedules << schedule.to_hash
    food_pantry.schedules = new_schedules
  end

  food_pantry.save!
end

class FoodPantry < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :town, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true

  def formatted_schedule
    schedules.each_with_object({
      monday: { hours: "Closed", ordinals: [] },
      tuesday: { hours: "Closed", ordinals: [] },
      wednesday: { hours: "Closed", ordinals: [] },
      thursday: { hours: "Closed", ordinals: [] },
      friday: { hours: "Closed", ordinals: [] },
      saturday: { hours: "Closed", ordinals: [] },
      sunday: { hours: "Closed", ordinals: [] }
    }) do |schedule, object|
      rrules = schedule["rrules"].first
      rule_type = rrules["rule_type"]
      start_time = schedule["start_time"]
      end_time = schedule["end_time"]
      formatted_hours = "#{Time.parse(start_time).in_time_zone("Eastern Time (US & Canada)").strftime("%-I:%M %p")} – #{Time.parse(end_time).in_time_zone("Eastern Time (US & Canada)").strftime("%-I:%M %p")}"

      if rule_type == "IceCube::WeeklyRule"
        days = rrules["validations"]["day"]
        days.each do |day|
          object[DateAndTime::Calculations::DAYS_INTO_WEEK.invert[day]][:hours] = formatted_hours
        end
      elsif rule_type == "IceCube::MonthlyRule"
        days_of_week = rrules["validations"]["day_of_week"]

        days_of_week.keys.each do |day|
          object[DateAndTime::Calculations::DAYS_INTO_WEEK.invert[day.to_i]][:hours] = formatted_hours
          object[DateAndTime::Calculations::DAYS_INTO_WEEK.invert[day.to_i]][:ordinals] += days_of_week.values.flatten
        end
      end
    end.map do |day, schedule|
      if schedule[:ordinals].present?
        ["#{schedule[:ordinals].map(&:ordinalize).to_sentence} #{day.to_s.capitalize}", schedule[:hours]]
      else
        [day.to_s.capitalize, schedule[:hours]]
      end
    end.to_h
  end

  def open_now?
    schedules.map do |schedule|
      IceCube::Schedule.from_hash(schedule).occurs_at?(Time.zone.now)
    end.any?
  end
end

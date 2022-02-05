class FoodPantry < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :town, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true

  def formatted_schedule
    schedules.each_with_object({
      monday: { hours: "Closed", per_month: [] },
      tuesday: { hours: "Closed", per_month: [] },
      wednesday: { hours: "Closed", per_month: [] },
      thursday: { hours: "Closed", per_month: [] },
      friday: { hours: "Closed", per_month: [] },
      saturday: { hours: "Closed", per_month: [] },
      sunday: { hours: "Closed", per_month: [] }
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
          object[DateAndTime::Calculations::DAYS_INTO_WEEK.invert[day.to_i]][:per_month] += days_of_week.values.flatten
        end
      end
    end.map do |day, schedule|
      if schedule[:per_month].present?
        ["#{schedule[:per_month].map(&:ordinalize).join(", ")} #{day.to_s.capitalize}", schedule[:hours]]
      else
        [day.to_s.capitalize, schedule[:hours]]
      end
    end.to_h
  end
end

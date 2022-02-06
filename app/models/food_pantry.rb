class FoodPantry < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :town, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true

  def formatted_schedule
    parsed_schedules.map do |day, schedule|
      if schedule[:ordinals].present?
        ["#{schedule[:ordinals].map(&:ordinalize).to_sentence} #{day.to_s.capitalize}", schedule[:hours]]
      else
        [day.to_s.capitalize, schedule[:hours]]
      end
    end.to_h
  end

  def parsed_schedules
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
      start_time = schedule["start_time"]["time"]
      end_time = schedule["end_time"]["time"]
      time_zone = schedule["start_time"]["zone"]
      formatted_hours = "#{Time.parse(start_time).in_time_zone(time_zone).strftime("%-I:%M %p")} – #{Time.parse(end_time).in_time_zone(time_zone).strftime("%-I:%M %p")}"

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
    end
  end

  def open_now?
    schedules.map do |schedule|
      IceCube::Schedule.from_hash(schedule).occurring_at?(Time.now.in_time_zone(schedule["start_time"]["zone"]))
    end.any?
  end

  def open_today?
    schedules.map do |schedule|
      IceCube::Schedule.from_hash(schedule).occurs_on?(Time.now.in_time_zone(schedule["start_time"]["zone"]).beginning_of_day.to_date)
    end.any?
  end

  def hours_today
    today = DateAndTime::Calculations::DAYS_INTO_WEEK.invert[Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_day.to_date.cwday]
    parsed_schedules[today][:hours]
  end
end

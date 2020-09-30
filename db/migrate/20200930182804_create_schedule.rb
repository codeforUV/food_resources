class CreateSchedule < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :day
      t.string :open_hours
      t.string :close_hours
    end
  end
end

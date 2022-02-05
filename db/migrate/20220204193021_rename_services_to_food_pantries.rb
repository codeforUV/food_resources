class RenameServicesToFoodPantries < ActiveRecord::Migration[7.0]
  def change
    drop_table :accessibility_for_disabilities do |t|
      t.references :location, null: false
      t.string :accessibility
      t.string :details
    
      t.timestamps
    end

    drop_table :languages do |t|
      t.references :service
      t.references :location
      t.string :language, null: false

      t.timestamps
    end

    drop_table :required_documents do |t|
      t.references :service, null: false
      t.string :document, null: false
    
      t.timestamps
    end
    
    drop_table :eligibilities do |t|
      t.references :service, null: false
      t.string :description, null: false

      t.timestamps
    end

    drop_table :schedules do |t|
      t.references :service
      t.references :location
      t.references :service_at_location
      t.datetime :valid_from
      t.datetime :valid_to
      t.datetime :dtstart
      t.integer :timezone
      t.datetime :until
      t.integer :count
      t.string :wkst
      t.string :freq
      t.integer :interval
      t.string :byday
      t.string :byweekno
      t.integer :bymonthday
      t.integer :byyearday
      t.string :description
      t.datetime :opens_at
      t.datetime :closes_at

      t.timestamps
    end

    drop_table :physical_addresses do |t|
      t.references :location, null: false
      t.string :attention
      t.string :address, null: false
      t.string :city, null: false
      t.string :region
      t.string :state_province, null: false
      t.string :postal_code, null: false
      t.string :country, null: false, default: "USA"

      t.timestamps
    end

    drop_table :phones do |t|
      t.references :location
      t.references :service
      t.references :organization
      t.references :service_at_location
      t.string :number, null: false
      t.integer :extension
      t.string :type
      t.string :language
      t.string :description

      t.timestamps
    end

    drop_table :service_at_locations do |t|
      t.references :service, null: false
      t.references :location, null: false
      t.string :description

      t.timestamps
    end

    drop_table :locations do |t|
      t.references :organization, null: false
      t.string :name
      t.string :description
      t.integer :latitude
      t.integer :longitude
    
      t.timestamps
    end

    remove_reference :services, :organization, null: false
    
    drop_table :organizations do |t|
      t.string :name, null: false
      t.string :description
      t.string :email
      t.string :url

      t.timestamps
    end

    remove_column :services, :interpretation_services, :string
    remove_column :services, :application_process, :string
    remove_column :services, :fees, :string

    rename_table :services, :food_pantries

    add_column :food_pantries, :phone_1, :string
    add_column :food_pantries, :phone_2, :string
    add_column :food_pantries, :address, :string
    add_column :food_pantries, :town, :string
    add_column :food_pantries, :state, :string
    add_column :food_pantries, :postal_code, :string
    add_column :food_pantries, :eligibility_criteria, :string
    add_column :food_pantries, :required_documents, :string
    add_column :food_pantries, :typically_available, :string
    add_column :food_pantries, :notes, :string
    add_column :food_pantries, :schedules, :jsonb, default: []
  end
end

class AddHsdsDataModel < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :email
      t.string :url

      t.timestamps
    end

    create_table :services do |t|
      t.references :organization, null: false
      t.string :name, null: false
      t.string :description
      t.string :url
      t.string :email
      t.status :status, null: false
      t.string :interpretation_services
      t.string :application_process
      t.string :fees      

      t.timestamps
    end

    create_table :locations do |t|
      t.references :organization, null: false
      t.string :name
      t.string :description
      t.integer :latitude
      t.integer :longitude
    
      t.timestamps
    end

    create_table :service_at_locations do |t|
      t.references :service, null: false
      t.references :location, null: false
      t.string :description

      t.timestamps
    end

    create_table :contacts do |t|
      t.references :organization
      t.references :service
      t.references :service_at_location
      t.string :name
      t.string :title
      t.string :department
      t.string :email

      t.timestamps
    end

    create_table :phones do |t|
      t.references :location
      t.references :service
      t.references :organization
      t.references :contact
      t.references :service_at_location
      t.string :number, null: false
      t.number :extension
      t.string :type
      t.string :language
      t.string :description

      t.timestamps
    end

    create_table :physical_addresses do |t|
      t.references :location, null: false
      t.string :attention
      t.string :address_1, null: false
      t.string :city, null: false
      t.string :region
      t.string :state_province, null: false
      t.string :postal_code, null: false
      t.string :country, null: false

      t.timestamps
    end

    create_table :postal_addresses do |t|
      t.references :location, null: false
      t.string :attention
      t.string :address_1, null: false
      t.string :city, null: false
      t.string :region
      t.string :state_province, null: false
      t.string :postal_code, null: false
      t.string :country, null: false

      t.timestamps
    end

    create_table :schedules do |t|
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

    create_table :eligibilities do |t|
      t.references :service, null: false
      t.string :description, null: false

      t.timestamps
    end

    create_table :required_documents do |t|
      t.references :service, null: false
      t.string :document, null: false
    
      t.timestamps
    end

    create_table :languages do |t|
      t.references :service
      t.references :location
      t.string :language, null: false

      t.timestamps
    end

    create_table :accessbility_for_disabilities do |t|
      t.references :location, null: false
      t.string :accessibility
      t.string :details
    
      t.timestamps
    end
  end
end

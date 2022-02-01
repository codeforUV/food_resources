class AddHsdsDataModel < ActiveRecord::Migration[6.1]
  def change
    remove_reference :schedules, :food_access_point
    drop_table :schedules do |t|
      t.string :day
      t.string :open_hours
      t.string :close_hours
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#organization
    # The organization record is used to provide basic description and details about each
    # organization delivering services. Each service should be linked to the organization
    # responsible for its delivery. One organization may deliver many services.
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :email
      t.string :url

      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#service
    # Services are provided by organizations to a range of different groups.
    # Details on where each service is delivered are contained in the services_at_location table.
    create_table :services do |t|
      t.references :organization, null: false
      t.string :name, null: false
      t.string :description
      t.string :url
      t.string :email
      t.string :interpretation_services
      t.string :application_process
      t.string :fees      

      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#location
    # The location tables provides details of the locations where organizations operate.
    # Locations may be virtual, and one organization may have many locations.
    create_table :locations do |t|
      t.references :organization, null: false
      t.string :name
      t.string :description
      t.integer :latitude
      t.integer :longitude
    
      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#service_at_location
    # The services at location table creates a link between a service and a specific location.
    create_table :service_at_locations do |t|
      t.references :service, null: false
      t.references :location, null: false
      t.string :description

      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#contact
    # The contact table contains details of the named contacts for services and organizations.
    # Note that in the HSDS data package format, if an individual is the contact for multiple
    # services, their details may be duplicated multiple times in this table, each time with a new
    # identifier, and with the rows containing different service ids.
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

    # https://docs.openreferral.org/en/latest/hsds/reference/#phone
    # The phone table contains details of the telephone numbers are used to contact organizations,
    # services, and locations.
    create_table :phones do |t|
      t.references :location
      t.references :service
      t.references :organization
      t.references :contact
      t.references :service_at_location
      t.string :number, null: false
      t.integer :extension
      t.string :type
      t.string :language
      t.string :description

      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#physical_address
    # The addresses table contains the physical addresses for locations
    create_table :physical_addresses do |t|
      t.references :location, null: false
      t.string :attention
      t.string :address, null: false
      t.string :city, null: false
      t.string :region
      t.string :state_province, null: false
      t.string :postal_code, null: false
      t.string :country, null: false

      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#schedule
    # The schedule table contains details of when a service or location is open.
    # Entries are RFC 5545 RRULES.
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

    # https://docs.openreferral.org/en/latest/hsds/reference/#eligibility
    # The eligibility tables contains details of the eligibility criteria for particular services
    create_table :eligibilities do |t|
      t.references :service, null: false
      t.string :description, null: false

      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#required_document
    # The required_document table contains details of any documents that are required in order to
    # access or use services.
    create_table :required_documents do |t|
      t.references :service, null: false
      t.string :document, null: false
    
      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#language
    # The language table contains details of the languages that are spoken at locations or services.
    # This does not include languages which can only be used with interpretation.
    create_table :languages do |t|
      t.references :service
      t.references :location
      t.string :language, null: false

      t.timestamps
    end

    # https://docs.openreferral.org/en/latest/hsds/reference/#accessibility_for_disabilities
    # The accessibility_for_disabilities table contains details of the arrangements for access to
    # locations for people who have disabilities
    create_table :accessibility_for_disabilities do |t|
      t.references :location, null: false
      t.string :accessibility
      t.string :details
    
      t.timestamps
    end
  end
end

# https://docs.openreferral.org/en/latest/hsds/reference/#service
# Services are provided by organizations to a range of different groups.
# Details on where each service is delivered are contained in the services_at_location table.

class Service < ApplicationRecord
  belongs_to :organization
  has_many :contacts
  has_many :eligibilities
  has_many :languages
  has_many :phones
  has_many :required_documents
  has_many :schedules
  has_many :service_at_locations
  has_many :locations, through: :service_at_locations

  validates :name, presence: true
end

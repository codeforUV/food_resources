# https://docs.openreferral.org/en/latest/hsds/reference/#service
# Services are provided by organizations to a range of different groups.
# Details on where each service is delivered are contained in the services_at_location table.

class Service < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  has_many :eligibilities
  has_many :languages
  has_many :phones
  has_many :required_documents
  has_many :schedules
  has_one :service_at_location
  has_one :location, through: :service_at_location

  validates :name, presence: true

  def display_name
    if name != organization.name
      "#{name} – #{organization.name}"
    else
      name
    end
  end
end

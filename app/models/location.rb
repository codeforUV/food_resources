# https://docs.openreferral.org/en/latest/hsds/reference/#location
# The location tables provides details of the locations where organizations operate.
# Locations may be virtual, and one organization may have many locations.

class Location < ApplicationRecord
  belongs_to :organization
  has_many :accessibility_for_disabilities
  has_many :languages
  has_many :phones
  has_many :schedules
  has_one :physical_address
  has_one :service_at_location
  has_one :service, through: :service_at_location
end

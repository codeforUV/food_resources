# https://docs.openreferral.org/en/latest/hsds/reference/#location
# The location tables provides details of the locations where organizations operate.
# Locations may be virtual, and one organization may have many locations.

class Location < ApplicationRecord
  belongs_to :organization
  has_many :accessibility_for_disabilities
  has_many :languages
  has_many :phones
  has_many :physical_addresses
  has_many :schedules
  has_many :service_at_locations
  has_many :services, through: :service_at_locations
end

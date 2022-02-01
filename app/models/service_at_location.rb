# https://docs.openreferral.org/en/latest/hsds/reference/#service_at_location
# The services at location table creates a link between a service and a specific location.

class ServiceAtLocation < ApplicationRecord
  belongs_to :service
  belongs_to :location
  has_many :phones
  has_many :schedules
  has_many :service_at_locations
end

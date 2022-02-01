# https://docs.openreferral.org/en/latest/hsds/reference/#schedule
# The schedule table contains details of when a service or location is open.
# Entries are RFC 5545 RRULES.

class Schedule < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :service_at_location, optional: true
  belongs_to :service, optional: true
end

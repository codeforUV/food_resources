# https://docs.openreferral.org/en/latest/hsds/reference/#contact
# The contact table contains details of the named contacts for services and organizations.
# Note that in the HSDS data package format, if an individual is the contact for multiple
# services, their details may be duplicated multiple times in this table, each time with a new
# identifier, and with the rows containing different service ids.

class Contact < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :service, optional: true
  belongs_to :service_at_location, optional: true
  has_many :phones
end

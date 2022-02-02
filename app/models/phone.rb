# https://docs.openreferral.org/en/latest/hsds/reference/#phone
# The phone table contains details of the telephone numbers are used to contact organizations,
# services, and locations.

class Phone < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :organization, optional: true
  belongs_to :service_at_location, optional: true
  belongs_to :service, optional: true

  validates :number, presence: true
end

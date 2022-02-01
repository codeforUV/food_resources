# https://docs.openreferral.org/en/latest/hsds/reference/#organization
# The organization record is used to provide basic description and details about each
# organization delivering services. Each service should be linked to the organization
# responsible for its delivery. One organization may deliver many services.

class Organization < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :contacts
  has_many :locations
  has_many :phones
  has_many :services
end

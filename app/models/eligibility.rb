# https://docs.openreferral.org/en/latest/hsds/reference/#eligibility
# The eligibility tables contains details of the eligibility criteria for particular services

class Eligibility < ApplicationRecord
  belongs_to :service

  validates :description, presence: true
end

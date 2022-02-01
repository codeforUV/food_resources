# https://docs.openreferral.org/en/latest/hsds/reference/#physical_address
# The addresses table contains the physical addresses for locations

class PhysicalAddress < ApplicationRecord
  belongs_to :location

  validates :address, presence: true
  validates :city, presence: true
  validates :state_province, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
end

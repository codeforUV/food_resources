# https://docs.openreferral.org/en/latest/hsds/reference/#accessibility_for_disabilities
# The accessibility_for_disabilities table contains details of the arrangements for access to
# locations for people who have disabilities

class AccessbilityForDisability < ApplicationRecord
  belongs_to :location
end

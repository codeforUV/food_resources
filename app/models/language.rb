# https://docs.openreferral.org/en/latest/hsds/reference/#language
# The language table contains details of the languages that are spoken at locations or services.
# This does not include languages which can only be used with interpretation.

class Language < ApplicationRecord
  belongs_to :service, optional: true
  belongs_to :location, optional: true
  
  validates :language, presence: true
end

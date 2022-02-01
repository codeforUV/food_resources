# https://docs.openreferral.org/en/latest/hsds/reference/#required_document
# The required_document table contains details of any documents that are required in order to
# access or use services.

class RequiredDocument < ApplicationRecord
  belongs_to :service

  validates :document, presence: true
end

class User < ApplicationRecord
  has_secure_password
  has_secure_token :session_token

  before_save :downcase_email
  
  has_many :food_access_points
  
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  def self.authenticate_by(attributes)
    passwords, identifiers = attributes.to_h.partition do |name, value|
      !has_attribute?(name) && has_attribute?("#{name}_digest")
    end.map(&:to_h)

    raise ArgumentError, "One or more password arguments are required" if passwords.empty?
    raise ArgumentError, "One or more finder arguments are required" if identifiers.empty?
    if (record = find_by(identifiers))
      record if passwords.count { |name, value| record.public_send(:"authenticate_#{name}", value) } == passwords.size
    else
      new(passwords)
      nil
    end
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end

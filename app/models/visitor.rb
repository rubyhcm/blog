class Visitor < ApplicationRecord
  validates :ip_address, uniqueness: true
end

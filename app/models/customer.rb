class Customer < ApplicationRecord
  has_many :documents, inverse_of: :customer

  validates_presence_of :name, :contract_value
end

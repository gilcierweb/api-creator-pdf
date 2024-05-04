class Customer < ApplicationRecord
  has_many :documents, inverse_of: :customer
end

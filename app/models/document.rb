class Document < ApplicationRecord
  belongs_to :customer, inverse_of: :documents
  accepts_nested_attributes_for :customer

  has_one_attached :pdf_url

end

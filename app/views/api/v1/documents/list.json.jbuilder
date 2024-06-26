json.array! @documents do |document|
  json.uuid document.id
  json.pdf_url document[:pdf_url]
  json.description document.description
  json.document_data do |customer|
    json.customer_name document.customer.name
    json.contract_value document.customer.contract_value
  end
  json.created_at document.created_at
end
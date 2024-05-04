json.description @document.customer_id
json.document_data do
  json.customer_name @document.customer.name
  json.contract_value @document.customer.contract_value
end
json.template @document.created_at

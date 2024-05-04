class Admin::DashboardController < AdminController
  include Pagy::Backend

  def index
    @pagy, @documents = pagy(Document.select(:pdf_url, :description, :'customers.name',:'customers.contract_value').joins(:customer).order(id: :desc))

  end
end

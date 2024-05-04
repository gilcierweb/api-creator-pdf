class Api::V1::DocumentsController < ApiController
  include SanitizeFields
  include ActionView::Helpers::NumberHelper

  def list
    @documents = Document.all
    render
  end

  def create
    @document = Document.new(document_params_parser)

    respond_to do |format|
      if @document.save
        data = { customer_name: @document.customer.name, contract_value: ActiveSupport::NumberHelper.number_to_currency(@document.customer.contract_value), }
        pdf = PdfCreator.generate(data)
        @document[:pdf_url] = pdf
        @document.save
        format.json { render json: data_response, status: :created }
      else
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.json { render json: data_response, status: :ok }
      else
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def document_params_parser
    params_replace = ActionController::Parameters.new({
                                       document: {
                                         description: params[:description],
                                         customer_attributes: {
                                           name: params[:document_data][:customer_name],
                                           contract_value: params[:document_data][:contract_value]
                                         },
                                         template: params[:template]
                                       }
                                     })

    params_replace.require(:document).permit(:description, :customer_id, customer_attributes: [:id, :name, :contract_value])

  end

  def sanitize_fields_params
    params[:document_data][:contract_value] = clear_decimal(params[:document_data][:contract_value])
  end

  def data_response
    {
      uuid: @document.id,
      pdf_url: @document.pdf_url,
      description: @document.description,
      document_data: [
        customer_name: @document.customer.name,
        contract_value: ActiveSupport::NumberHelper.number_to_currency(@document.customer.contract_value)
      ],
      created_at: @document.created_at
    }
  end

end

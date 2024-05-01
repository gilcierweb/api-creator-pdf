class Api::V1::DocumentsController < ApplicationController
  def list
    @documents = Document.all
    # render 'index'
    # render json: @documents
    render
  end

  def create
  end

  private

  def document_params
    params.require(:document).permit(:name, :description, :customer_id)

  end
end

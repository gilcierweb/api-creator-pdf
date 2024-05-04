module PdfCreator
  require 'action_view'
  include ActionView::Helpers::NumberHelper

  def self.generate(variables_replace = {})

    template = ActionController::Base.new.render_to_string(
      # template: "home/test",
      # template: "api/v1/documents/template",
      template: "shared/template",
      layout: "pdf",
    )

    template.gsub!(/{{(\w+)}}/) { variables_replace.as_json[$1] }

    pdf = WickedPdf.new.pdf_from_string(
      template
    )

    File.open(file_path, "wb") do |file|
      file.write(pdf)
    end

    file_path
  end

  private

  def self.file_path
    file_path ||= Rails.root.join("public/pdfs/#{random_name}.pdf")
  end

  def self.random_name
    SecureRandom.hex(16)
  end

end
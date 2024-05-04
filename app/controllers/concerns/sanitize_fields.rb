module SanitizeFields
  extend ActiveSupport::Concern

  included do
    before_action :sanitize_fields_params, :only => [:create, :update]
  end

  def clear_decimal(field)
    (field.to_s.strip.gsub(/[^\d]/, '').to_d / 100.to_d) unless field.blank?
  end

  def clear_integer(field)
    field.to_s.strip.gsub(/[^\d]/, '') unless field.blank?
  end

end
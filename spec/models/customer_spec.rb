require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many :documents }

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :contract_value }
  end
end

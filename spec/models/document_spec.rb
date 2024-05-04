require 'rails_helper'

RSpec.describe Document, type: :model do
  it { should belong_to :customer }

  context 'validations' do
    it { should validate_presence_of :description }
  end

end

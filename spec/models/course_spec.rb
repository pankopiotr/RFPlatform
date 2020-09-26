require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:training_modules) }
  end
end

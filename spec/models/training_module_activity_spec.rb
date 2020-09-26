require 'rails_helper'

RSpec.describe TrainingModuleActivity, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:training_module) }
  end
end

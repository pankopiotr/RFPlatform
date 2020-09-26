require 'rails_helper'

RSpec.describe TrainingModule, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:courses) }
  end

  describe 'attributes' do
    it { is_expected.to define_enum_for(:difficulty).with_values({ easy: 1000, medium: 2000, hard: 3000 }) }
    it { is_expected.to define_enum_for(:kind).with_values({ hands_on: 1000, theory: 2000 }) }
  end
end

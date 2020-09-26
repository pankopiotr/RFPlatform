require 'rails_helper'

RSpec.describe TopTrainingModulesQuery, type: :query do
  describe '.call' do
    it 'returns X most executed TrainingModules within last Y days', :slow do
      create(:training_module, :with_activities, activities_count: 1)
      tm2 = create(:training_module, :with_activities, activities_count: 2)
      create(:training_module, :with_activities, activities_count: 3, activities_type: 'invalid')
      tm4 = create(:training_module, :with_activities, activities_count: 4)
      create(:training_module, :with_activities, activities_count: 5, activities_age: DateTime.current - 8.days)

      result = described_class.new(limit: 2, days: 7.days).call

      expect(result).to match_array([tm2, tm4])
    end
  end
end

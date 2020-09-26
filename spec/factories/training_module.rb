FactoryBot.define do
  factory :training_module do
    trait :with_activities do
      transient do
        activities_count { 0 }
        activities_type { 'execute' }
        activities_age { DateTime.current }
      end

      after(:create) do |training_module, evaluator|
        create_list(:training_module_activity,
                    evaluator.activities_count,
                    activity_name: evaluator.activities_type,
                    created_at: evaluator.activities_age,
                    training_module: training_module)

        training_module.reload
      end
    end
  end
end

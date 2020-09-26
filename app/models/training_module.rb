class TrainingModule < ApplicationRecord
  # Custom integers for easier sorting when enum grows + explicit
  enum difficulty: { easy: 1000, medium: 2000, hard: 3000 }
  enum kind: { hands_on: 1000, theory: 2000 }

  has_and_belongs_to_many :courses
  has_many :training_module_activities, dependent: :destroy
  has_many :categories, through: :courses

  scope :join_and_sort_by_category_name, -> { joins(:categories).order('categories.name ASC, training_modules.name') }
end

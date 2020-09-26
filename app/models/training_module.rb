class TrainingModule < ApplicationRecord
  # Custom integers for easier sorting when enum grows + explicit
  enum difficulty: { easy: 1000, medium: 2000, hard: 3000 }
  enum kind: { hands_on: 1000, theory: 2000 }

  has_and_belongs_to_many :courses
end

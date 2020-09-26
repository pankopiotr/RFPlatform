class Category < ApplicationRecord
  has_many :courses, dependent: :nullify
  has_many :training_modules, through: :courses
end

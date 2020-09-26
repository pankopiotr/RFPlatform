class Course < ApplicationRecord
  has_and_belongs_to_many :training_modules
  belongs_to :category
end

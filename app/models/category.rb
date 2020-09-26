class Category < ApplicationRecord
  has_many :courses, dependent: :nullify
end

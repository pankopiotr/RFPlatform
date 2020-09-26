class AddCategoryFkToCourse < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :category, index: true, on_delete: :nullify
  end
end

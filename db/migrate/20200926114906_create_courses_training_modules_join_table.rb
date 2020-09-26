class CreateCoursesTrainingModulesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :courses, :training_modules do |t|
      t.index :courses
      t.index :training_modules
    end

    # Speed up retrieval of given pairs with composite index
    add_index :courses_training_modules, [:course_id, :training_module_id], unique: true, name: 'courses_training_modules_composite'
  end
end

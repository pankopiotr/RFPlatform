class CreateTrainingModuleActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :training_module_activities do |t|
      t.string :activity_name

      t.timestamps
    end
  end
end

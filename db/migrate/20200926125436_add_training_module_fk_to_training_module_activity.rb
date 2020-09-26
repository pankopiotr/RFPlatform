class AddTrainingModuleFkToTrainingModuleActivity < ActiveRecord::Migration[6.0]
  def change
    # Depending on how often we query this data, we might decide not to use index
    # as it will grow huge, but might not bring that much value
    add_reference :training_module_activities, :training_module, index: true, on_delete: :destroy
  end
end

class CreateTrainingModules < ActiveRecord::Migration[6.0]
  def change
    create_table :training_modules do |t|
      t.string :name
      t.text :description
      t.integer :difficulty
      t.integer :kind

      t.timestamps
    end
  end
end

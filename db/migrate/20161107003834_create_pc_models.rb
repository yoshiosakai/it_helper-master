class CreatePcModels < ActiveRecord::Migration[5.0]
  def change
    create_table :pc_models do |t|
      t.string :pc_name
      t.string :pc_model

      t.timestamps
    end
  end
end

class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :role
      t.string :name
      t.date :date
      t.time :time
      t.string :machine_name
      t.string :machine_number
      t.text :problem
      t.text :cause
      t.text :try_solution

      t.timestamps
    end
  end
end

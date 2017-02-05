class CreateOperators < ActiveRecord::Migration[5.0]
  def change
    create_table :operators do |t|
      t.references :report, index: true, foreign_key: true
      t.string :status
      t.string :name
      t.text :try_solution
      t.text :solution
      t.integer :report_id

      t.timestamps
    end
  end
end

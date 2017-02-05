class CreateRents < ActiveRecord::Migration[5.0]
  def change
    create_table :rents do |t|
      t.string :user
      t.string :machine
      t.date :return_date
      t.time :return_time
      t.boolean :return

      t.timestamps
    end
  end
end

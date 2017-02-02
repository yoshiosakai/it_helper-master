class CreateAttachedFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :attached_files do |t|
      t.string :file_name
      
      t.timestamps
    end
  end
end

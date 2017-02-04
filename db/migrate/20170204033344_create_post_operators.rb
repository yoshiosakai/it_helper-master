class CreatePostOperators < ActiveRecord::Migration[5.0]
  def change
    create_table :post_operators do |t|
      t.integer :free_post_id
      t.string :name
      t.string :status
      t.text :memo

      t.timestamps
    end
  end
end

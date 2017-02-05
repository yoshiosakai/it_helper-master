class CreateFreePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :free_posts do |t|
      t.text :name
      t.text :title
      t.text :detail

      t.timestamps
    end
  end
end

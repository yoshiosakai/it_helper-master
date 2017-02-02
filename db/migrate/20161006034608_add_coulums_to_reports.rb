class AddCoulumsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :problem_other, :string
    add_column :reports, :urgency, :string
  end
end

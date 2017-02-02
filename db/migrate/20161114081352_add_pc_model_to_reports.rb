class AddPcModelToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :pc_model, :string
  end
end

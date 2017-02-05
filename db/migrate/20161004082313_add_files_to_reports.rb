class AddFilesToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :file1, :string
    add_column :reports, :file2, :string
    add_column :reports, :file3, :string
    add_column :reports, :file4, :string
  end
end

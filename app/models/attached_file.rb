class AttachedFile < ApplicationRecord
  belongs_to :report, optional: true

=begin
  def self.create_files_by(file_params)
    file_params[:filename].each do |file|
      new_file = Attached_file.new(file_name: file)
      #return false unless new_file.save!
    end
  end
=end
end

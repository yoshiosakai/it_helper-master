class PcModel < ApplicationRecord
  require "csv"

  has_many :reports

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      obj = new
      obj.attributes = row.to_hash.slice(*updatable_attributes)

      obj.save!
    end
  end

  def self.updatable_attributes
    ["pc_name","pc_model"]
  end

end

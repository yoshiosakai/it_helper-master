class Report < ApplicationRecord
  has_one :operator
  accepts_nested_attributes_for :operator, allow_destroy: true

  has_one :pc_model

  has_many :attached_files
  accepts_nested_attributes_for :attached_files, allow_destroy: true

  validates :problem, presence:true
  validates :machine_name, presence:true
  validates :urgency, presence:true
end

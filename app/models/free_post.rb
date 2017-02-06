class FreePost < ApplicationRecord
  has_one :post_operator
  accepts_nested_attributes_for :post_operator, allow_destroy: true

  validates :name, presence:true
end

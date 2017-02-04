class Operator < ApplicationRecord
  belongs_to :report, optional: true
  belongs_to :free_posts
end

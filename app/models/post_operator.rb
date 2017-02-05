class PostOperator < ApplicationRecord
  belongs_to :free_post, optional: true
end

class Like < ApplicationRecord
  belongs_to :flower
  belongs_to :user
  validates_uniqueness_of :flower_id, scope: :user_id
end

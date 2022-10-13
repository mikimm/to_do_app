class Task < ApplicationRecord
  belongs_to :user
  has_one :memo,foreign_key: :task_id, dependent: :destroy
end

class Memo < ApplicationRecord
with_options presence: true do
  validates :url
  validates :region
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  validates :CEO
  validates :content
end
  belongs_to :user
  belongs_to :task
end

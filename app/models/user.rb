class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, length: { maximum: 6 }
  validates :password, presence: true, length: { minimum: 6 }
  has_many :tasks
end

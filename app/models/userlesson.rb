class Userlesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :tasks, through: :lesson
end

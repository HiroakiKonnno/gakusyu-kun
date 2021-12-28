class Lesson < ApplicationRecord
  has_many :userlessons
  has_many :users, :through => :userlessons
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
end
